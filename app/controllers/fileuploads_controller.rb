class FileuploadsController < ApplicationController
  def index
    @img_paths = []
    jpgs = Dir.glob(Rails.root.join('public', '*.jpg'))
    jpgs.each do |png|
      @img_paths.push('/' + File.basename(png))
    end
  end

  def create
    uploaded_file = fileupload_param[:file]
    output_path = Rails.root.join('public/user_images/', uploaded_file.original_filename)
    	
    File.open(output_path, 'w+b') do |fp|
      fp.write  uploaded_file.read
    end
    	
    redirect_to action: 'index'
    
  end
  	
  private
  def fileupload_param
    params.require(:fileupload).permit(:file)
  end
  def new
  end
end
