class ImageAdapt

  def self.resize(url, height, width)
    image = MiniMagick::Image.open url
    image.resize "#{height}x#{width}"
  end

end
