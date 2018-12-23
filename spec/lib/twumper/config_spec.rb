RSpec.describe Twumper::Config do
  it 'has default configuration values' do 
    twumper = Twumper.new  
    expect(twumper.headers).to eq({
      :accept=>"application/json", 
      :content_type=>"application/x-www-form-urlencoded;charset=UTF-8", 
      :user_agent=>"twumper gem 0.1.0"
    })
  end

  it "has adjustable configuration values" do
    twumper = Twumper.new
  	expect(twumper.consumer_key).to eq(nil)
  	twumper.config do |twumper|
      twumper.consumer_key = 'abcd12345'
  	end
  	expect(twumper.consumer_key).to eq('abcd12345')
  end
end