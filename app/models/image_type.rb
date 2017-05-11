class ImageType
  include Mongoid::Document
  field :dimension_name, type: String
  field :url, type: String
  embedded_in :image
end
