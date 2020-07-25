require 'branca'

module Branca
  class Configuration
    attr_accessor :ttl
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.default
  end
end

module Branca
  module_function

  def encode(*args)
    Token.new(*args).encode
  end

  def decode(token, ttl=false)
    ttl ||= configuration.ttl ||= 7200

    Token.decode(token).then do |token|
      if Time.now.utc > token.timestamp + ttl
        raise StandardError, 'Token is expired.'
      end

      token.payload
    end
  end
end

Branca.configure do |config|
  config.secret_key = ENV.fetch('BRANCA_SECRET_KEY').dup.force_encoding('ASCII-8BIT')
end
