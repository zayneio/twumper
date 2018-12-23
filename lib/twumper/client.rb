require_relative 'config'
require_relative 'connection'
require_relative 'request'
require_relative 'response'
require_relative 'search'

module Twumper
  class Client
    include Twumper::Request
    include Twumper::Response
    include Twumper::Connection
    include Twumper::Config

    def initialize
      reset
    end     
  end
end