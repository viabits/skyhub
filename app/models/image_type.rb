class ImageType
  include Mongoid::Document
  field :dimension_name, type: String
  field :url, type: String
  embedded_in :image

  def self.list_as_json
    urls = {}
    Image.all.each do |image|
      image.image_types.each do |type|
        urls[url_name(type)] = type.url
      end
    end
    urls.to_json
  end

  private

  def self.url_name(type)
    type.url.split('/').last
  end
end
