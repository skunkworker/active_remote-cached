require 'rubygems'
require 'bundler'
Bundler.require(:default, :development, :test)

require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

class HashCache < Hash
  def exist?(key)
    self.has_key?(key)
  end

  def fetch(key, options = {}, &blk)
    if self.has_key?(key)
      return self[key]
    end

    self[key] = yield
  end

  def read(key)
    self[key]
  end

  def write(key, value)
    self[key] = value
  end
end

require 'mocha/api'

RUBY_AND_ACTIVE_SUPPORT_VERSION = "#{RUBY_ENGINE_VERSION}:#{ActiveSupport::VERSION::STRING}".freeze
