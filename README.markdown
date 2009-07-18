ziggy
=====

Cache any method on any class using Rails.cache

Install
-------

    $ gem sources -a http://gems.github.com (you only have to do this once)
    $ sudo gem install opsb-ziggy

Introduction
------------

ziggy will cache methods and then expire them. The results from method invocations are stored in and read from the Rails.cache using Rails.cache.write(key, value) and Rails.cache.read(key).

### Cache a method

	class TwitterUser
	  include Ziggy
	  cached :timeline

	  def timeline
		twitter_client.timeline
	  end

	  ...

	end

### Cache many methods

	class TwitterUser
	  include Ziggy
	  cached :timeline, :direct_messages

	  def timeline
		twitter_client.timeline
	  end

	  def direct_messages
	    twitter_client.direct_messages
	  end

	  ...

	end

### expire_after

The default expire_after time is 2.5.minutes, to customise do

	class TwitterUser
	  include Ziggy
	  cached :timeline, :expire_after => 1.5.minutes

	  def timeline
		twitter_client.timeline
	  end

	  ...

	end

### Customise key

The method name and arguments are always used as the base of the cache key. You can customise the start of the cache key using a block.

    class TwitterUser
      include Ziggy
      cached :timeline { |twitterUser| twitterUser.screen_name }

	  def timeline
		twitter_client.timeline
	  end

	  ...

	end

### Different options for different methods

	class TwitterUser
	  include Ziggy
	  cached :timeline, :expire_after => 1.minutes { |twitterUser| twitterUser.screen_name }
	  cached :direct_messages, :expire_after => 10.minutes { |twitterUser| twitterUser.screen_name }

	  def timeline
		twitter_client.timeline
	  end

	  def direct_messages
	    twitter_client.direct_messages
	  end

	  ...

	end
