module Twumper
  module Config

    attr_accessor :headers, :consumer_key, :consumer_secret, :bearer

    def config 
     yield self
    end 

    def reset 
      self.headers = nil
      self.consumer_key = nil
      self.consumer_secret = nil
      self.bearer = nil
      self
    end

    def get_bearer
      self.bearer = build_bearer_request
    end

    def build_bearer_request
      credentials = set_credentials
      url = "https://api.twitter.com/oauth2/token"
      body = "grant_type=client_credentials"
      headers = set_headers(credentials)
      request_bearer(url, body, headers)
    end

    def set_credentials
      credentials = Base64.encode64("#{self.consumer_key}:#{self.consumer_secret}").gsub("\n", '')
    end

    def set_headers(credentials=nil)
      if self.bearer.nil? && credentials
        self.headers = { "Authorization" => "Basic #{credentials}" }
      else
        self.headers = { "Authorization" => "Bearer #{self.bearer}" }
      end
    end

    def request_bearer(url, body, headers)
      resp = connection.post(url, body: body, headers: headers)
      bearer_token = resp['access_token']
    end    
  end
end