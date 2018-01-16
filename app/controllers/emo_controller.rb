require 'net/https'


class EmoController < ApplicationController
  before_action :authenticate_user!

  @@response_data = ""

  def show
    @img_paths = []
    jpgs = Dir.glob(Rails.root.join('public', '*.jpg'))
    jpgs.each do |png|
      @img_paths.push('/' + File.basename(png))
    end
  end


  def submit
    uploaded_file = emo_param[:file]
    output_path = Rails.root.join('public/user_images/', uploaded_file.original_filename)
    	
    File.open(output_path, 'w+b') do |fp|
      fp.write  uploaded_file.read
    end
      
    

    
    # NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
    #   For example, if you obtained your subscription keys from westcentralus, replace "westus" in the 
    #   URL below with "westcentralus".
    uri = URI('https://westus.api.cognitive.microsoft.com/emotion/v1.0/recognize')
    uri.query = URI.encode_www_form({})

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
    request['Ocp-Apim-Subscription-Key'] = 'XXXXXXXXXXXXXXXX'
    # Request body
    request.body = "{\"url\":\"https://keio.box.com/shared/static/gvt5f9p9ozfndewfa6aimte2o8masx8y.jpg\"}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    puts "API の結果"
    puts response.body.to_s

    @@response_data = response.body.to_s

    #redirect_to action: 'emo#capture'
    redirect_to :action => "capture"
    
  end
    
  def add
  end

  def rmove
  end

  def capture
    puts @@response_data
    @emotion_data = @@response_data
  end
  
  private
  def emo_param
    params.require(:fileupload).permit(:file)
  end
end
