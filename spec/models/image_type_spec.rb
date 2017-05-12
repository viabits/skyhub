require 'rails_helper'

RSpec.describe ImageType, type: :model do

  before do
    Mongoid.purge!
  end

  let(:base_url) {'http://54.152.221.29/images/'}
  let(:base_image_type_url) {'https://skyhub-bucket.s3.amazonaws.com/'}
  let(:param) {{file_name: 'b737_5.jpg', url: "#{base_url}b737_5.jpg"}}

  context 'when creating an image' do
    let(:url) {["#{base_url}b737_5.jpg"]}
    let(:first_image_type) {Image.first.image_types.first}

    before do
      Image.create_images(url)
    end

    it 'creates three image types' do
      expect(Image.first.image_types.count).to eql(3)
    end

    context 'and creating image types' do
      it 'creates first dimension_name correctly' do
        expect(first_image_type.dimension_name).to eql('small')
      end

      it 'creates first url correctly' do
        expect(first_image_type.url).to eql("#{base_image_type_url}b737_5-small.jpg")
      end

    end

  end

end
