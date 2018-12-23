require_relative 'response'

module Twumper
  module Request
    def get(url, options = {})
      request(:get, url, options)
    end

    def post(url, options = {})
      request(:post, url, options)
    end

    private

    def request(method, url, options)
      case method
      when :get 
        response = connection.get(url, headers: headers)
      when :post
      	response = connection.post(url, body: body, headers: headers)
      end
      # build(response.body)
      response.body
    end
  end
end