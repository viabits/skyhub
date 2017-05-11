require 'web_service/image_adapt'
require 'web_service/file_bucket'

class Image
  include Mongoid::Document
  field :file_name, type: String
  field :url, type: String

  embeds_many :image_types

  def self.create_images(urls)
    urls.each do |url|
      create_image(url) unless self.where(url: url).exists?
    end
  end

  private

  def self.create_image(url)
    file_name = extract_file_name(url)
    image = self.create(file_name: file_name, url: url)
    Settings.images[:dimensions].each do |dim_name, dim|
      resized_image = ImageAdapt.resize(url, dim[:height], dim[:width])
      upload_url = FileBucket.upload(file_name(dim_name, file_name), resized_image.path)
      ImageType.create(image: image, dimension_name: dim_name, url: upload_url)
    end
    image.save
  end

  def self.file_name(dimension_name, file_name)
    splited_name = file_name
    splited_name.first << "-#{dimension_name}." << splited_name.last
  end

  def self.extract_file_name(url)
    url.split('/').last
  end

end
