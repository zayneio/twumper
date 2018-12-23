module Twumper
  module Config
    
    attr_accessor :headers, :consumer_key, :consumer_secret, :bearer
    
    DEFAULT_API_URL = 'https://api.twitter.com/1.1/'
    DEFAULT_HEADERS = { 
    	accept: 'application/json', 
    	user_agent: "twity gem #{Twumper::VERSION}",
		  content_type: "application/x-www-form-urlencoded;charset=UTF-8"
    }

    def config 
     yield self
    end 

    def reset 
      self.headers = DEFAULT_HEADERS
      self.consumer_key = nil
      self.consumer_secret = nil
      self.bearer = nil
      self
    end

    def get_bearer
      self.bearer = setup_bearer_request
    end

    def setup_bearer_request
      credentials = set_auth_credentials
      url = "https://api.twitter.com/oauth2/token"
      body = "grant_type=client_credentials"
      headers = set_headers(credentials)
      request_bearer(url, body, headers)
    end
    
    def set_auth_credentials
      credentials = Base64.encode64("#{self.consumer_key}:#{self.consumer_secret}").gsub("\n", '')
    end

    def set_headers(credentials)
      self.headers = {
        "Authorization" => "Basic #{credentials}",
        "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"
      }
    end

    def request_bearer(url, body, headers)
      resp = connection.post(url, body: body, headers: headers)
      bearer_token = JSON.parse(resp)['access_token']
    end
  end
end