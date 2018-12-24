require "twumper/version"
require "twumper/client"

module Twumper
  class << self

    def new
      @client ||= Twumper::Client.new
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super
    end
  end
end
