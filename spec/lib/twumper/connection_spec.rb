require 'httparty'
RSpec.describe Twumper::Connection do 
  it 'creates a wrapper around HTTParty' do 
    twumper = Twumper.new
    resp = twumper.get('https://api.twitter.com/1.1/')
    expect(resp).to_not eq(nil)
  end
end