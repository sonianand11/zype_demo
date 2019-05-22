class ZypeClient
  
  attr_accessor :client

  def initialize
    @client = Faraday.new(:url => "https://api.zype.com", params: {app_key: ENV['ZYPE_APP_KEY']})
  end

  def videos
    response = JSON.parse(@client.get('/videos').body)["response"]
    v = []
    response.each do |video_hash|
      v << OpenStruct.new(video_hash)
    end
    v
  end

  def get_video(id)
    OpenStruct.new( JSON.parse(@client.get("/videos/#{id}").body)["response"] )
  end


end