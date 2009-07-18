ziggy
=====

Cache any method on any class using rails.cache

Install
-------

$ gem sources -a http://gems.github.com (you only have to do this once)
$ sudo gem install opsb-ziggy

Introduction
------------

### Add caching to a method

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
  cached :timeline

  def timeline
	twitter_client.timeline
  end

  def direct_messages
    twitter_client.direct_messages
  end

  ...

end

### Specify expire_after
class TwitterUser
  include Ziggy
  cached :timeline, :expire_after => 1.5.minutes

  def timeline
	twitter_client.timeline
  end

  ...

end

### Use block to parameterise key

The method name and arguments are always used as the base of the cache key. Using a block you can differentiate the keys based on further criteria e.g. screen_name.

    class TwitterUser
      include Ziggy
      cached :timeline { |twitterUser| twitterUser.screen_name }

	  def timeline
		twitter_client.timeline
	  end

	  ...

	end

### Specify different options for different methods

The method name and arguments are always used as the base of the cache key. Using a block you can differentiate the keys based on further criteria e.g. screen_name.

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
