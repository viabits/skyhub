require 'web_service/images'

class ImagesController < ApplicationController
  def list
    render json: ImageType.list_as_json
  end

  def feed
    image_web_service = WebService::Images.new
    ImageCreatorJob.perform_async(image_web_service.urls)
    render json: message, status: :ok
  rescue StandardError => e
    render json: {error: e.to_s}, status: 500
  end


  private

  def message
    dev_url = 'localhost:3000/images/list'
    prod_url = 'http://skyhubapp.heroku.com/images/list'
    url = Rails.env.development? ? dev_url : prod_url
    "Image creation in progress. To see the results, go to #{url} in a few minutes."
  end

end
