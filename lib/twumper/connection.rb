require 'httparty'

module Twumper
  module Connection
    def connection
      HTTParty
    end
  end
end