# Twumper

Twumper is a simple gem to interface with the Twitter API.

## Usage

```ruby
twumper = Twumper.new

#set consumer key and secret values 
twumper.config do |tw|
  tw.consumer_key = YOUR_CONSUMER_KEY
  tw.consumer_secret = YOUR_CONSUMER_SECERET
end

# retrieve and set your bearer token
twumper.get_bearer

# search for a keyword and retrieve related tweets
twumper.search('christmas')
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
