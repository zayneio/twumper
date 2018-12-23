module Twumper
  module Search
		# == Action ==
		# Makes a search request to Twitter API based on a specific keyword, returns a list of tweet objects
		# == Inputs ==
		# keyword: string
		# max_id: integer, the id of the last tweet in each bulk collection request
		# count: integer
		# limit: integer
		# result_type: string #options: 'mixed', 'recent', 'popular'
		# == Response == 
		# Returns an array of tweets on a given keyword, optionally filtered
		# count=100, limit=200, result_type='mixed', max_id=nil
		def search(keyword, options = {})	
			tweets = Array.new
			while tweets.count < options[:limit]
			  url = "https://api.twitter.com/1.1/search/tweets.json?q=#{keyword}&result_type=#{options[:result_type]}&count=#{options[:count]}"
			  url += "&max_id=#{options[:max_id]}" if !options[:max_id].nil?
			  headers = set_headers
			  response = connection.get(url, headers)
			  tweets += response['statuses']
			  options[:max_id] = tweets.last['id']
			  puts "collecting tweets, current count #{tweets.count}"
			end
			tweets
		end     
  end
end