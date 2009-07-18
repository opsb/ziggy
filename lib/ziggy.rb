module Ziggy2

  def self.included(base)
    base.extend ClassMethods
    base.instance_eval do
      @should_be_cached = []
      @cached = []  
      @keygens = {}
      @expire_after = {}
    end
  end

  module ClassMethods
    def cached(*cachable_methods, &block)
      opts = (cachable_methods.pop if cachable_methods.last.kind_of? Hash) || {}
      @should_be_cached += cachable_methods
      cachable_methods.each do |m| 
        @keygens[m] = block
        @expire_after[m] = opts[:expire_after] || 2.5.minutes
      end
    end
    
    def should_be_cached?(method)
      @should_be_cached.include? method
    end
    
    def cached?(method)
      @cached.include? method
    end
    
    def method_added(method)
      return unless should_be_cached?(method) && !cached?(method)
      @cached << method
      method_without_cache = "#{method}_without_cache".to_sym
      class_eval do 
        alias_method method_without_cache, method 
        define_method(method) do |*args|
          key = self.class.build_key(self, method, args)
          return Rails.cache.read(key) if Rails.cache.exist?(key)
          result = send(method_without_cache, *args)
          Rails.cache.write(key, result, :expires_in => expire_after(method))
          result
        end
      end
      logger.debug "Caching added to #{self}.#{method}"
    end    
    
    def expire_after(method)
      @expire_after[method]
    end
    
    def build_key(instance, method, args)
      invocation_key = "#{method}#{ args.collect{ |a| a.to_s } }"
      keygen = @keygens[method]
      differentiator = (keygen.call(instance) unless keygen.nil?) || ""
      differentiator + invocation_key
    end    
  end
  
end