require 'web_service/images'

class ImagesController < ApplicationController
  def list
  end

  def feed
    image_web_service = WebService::Images.new
    ImageCreatorJob.perform_async(image_web_service.urls)
    render json: 'Image creation in progress.', status: :ok
  end
end
