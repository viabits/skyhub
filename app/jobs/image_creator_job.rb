class ImageCreatorJob
  include SuckerPunch::Job

  def perform(urls)
    Image.create_images(urls)
  end
end
