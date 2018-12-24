module Twumper
  module Search
    
    BASE_URL = "https://api.twitter.com/1.1/search/tweets.json"
    DEFAULT_OPTIONS = { 
      count: 100, 
      limit: 200, 
      result_type: 'mixed', 
      max_id: nil 
    }
    
    def search(keyword, options=DEFAULT_OPTIONS) 
      tweets = Array.new
      while tweets.count < options[:limit]
        url = "#{BASE_URL}?q=#{keyword}&result_type=#{options[:result_type]}&count=#{options[:count]}"
        url += "&max_id=#{options[:max_id]}" if !options[:max_id].nil?
        headers = set_headers
        response = connection.get(url, headers: headers)
        tweets += response['statuses']
        options[:max_id] = tweets.last['id']
      end
      tweets
    end
  end
end