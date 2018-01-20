#
#   emo_controllers.rb
#   mosha
#
#   Copyright (c) 2018 Shota Shimazu. All rights reserved.
#

require 'net/https'
require 'date'


class EmoController < ApplicationController
  before_action :authenticate_user!, except: [:get_image]



  @@global_host = "133.27.74.96:3000"
  @@response_data = ""

  def show
    @img_paths = []
    jpgs = Dir.glob(Rails.root.join('public', '*.jpg'))
    jpgs.each do |png|
      @img_paths.push('/' + File.basename(png))
    end
  end


  def get_image
    unless params[:file_name].blank?
      file_name = params[:file_name].to_s
    end
    stat = File::stat('public/user_images/' + file_name)

    send_file('public/user_images/' + file_name, :filename => file_name, :length => stat.size)
  end

  def submit

    t = Time.now.to_datetime.to_s

    uploaded_file = emo_param[:file]
    output_path = Rails.root.join('public/user_images/', t + "-" + uploaded_file.original_filename)
    	
    File.open(output_path, 'w+b') do |fp|
      fp.write  uploaded_file.read
    end

    @@response_data = request_api()

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

  def request_api
    
    # Define API entrypoint
    uri = URI('https://westus.api.cognitive.microsoft.com/emotion/v1.0/recognize')

    # Create query
    uri.query = URI.encode_www_form({})

    request = Net::HTTP::Post.new(uri.request_uri)

    # HTTP Headers
    request['Content-Type'] = 'application/json'
    request['Ocp-Apim-Subscription-Key'] = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  
    # http://localhost:3000/emo/get_image?file_name=02135EC4-5437-46C0-A6DF-4FC586C2C405.jpeg
    request.body = "{\"url\":\"http://" + @@global_host + "/emo/get_image?file_name=" + uploaded_file.original_filename + "\"}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    return response.body.to_s
  end


end
