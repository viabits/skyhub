require 'rails_helper'

RSpec.describe Image, type: :model do

  before do
    Mongoid.purge!
  end

  let(:base_url) {'http://54.152.221.29/images/'}
  let(:param) {{file_name: 'b737_5.jpg', url: "#{base_url}b737_5.jpg"}}

  context 'when creating an image' do
    subject {Image.create!(param)}

    it 'creates a valid image' do
      expect(subject).to be_valid
    end

  end

  describe '.create_images' do
    #let(:urls) {["#{base_url}b737_5.jpg", "#{base_url}b777_5.jpg",
    #             "#{base_url}b737_3.jpg", "#{base_url}b777_4.jpg",
    #             "#{base_url}b777_3.jpg", "#{base_url}b737_2.jpg",
    #             "#{base_url}b777_2.jpg", "#{base_url}b777_1.jpg",
    #             "#{base_url}b737_4.jpg", "#{base_url}b737_1.jpg"]}
    let(:urls) {["#{base_url}b737_5.jpg", "#{base_url}b737_1.jpg"]}

    before do
      Image.create_images(urls)
    end

    it 'creates all images' do
      expect(Image.count).to eql(urls.size)
    end

    it 'creates first file_name correctly' do
      expect(Image.where(url: urls.first).pluck(:file_name)[0]).to eql('b737_5.jpg')
    end

    it 'creates last file_name correctly' do
      expect(Image.where(url: urls.last).pluck(:file_name)[0]).to eql('b737_1.jpg')
    end

    it 'creates first url correctly' do
      expect(Image.where(url: urls.first).pluck(:url)[0]).to eql("#{base_url}b737_5.jpg")
    end

    it 'creates last url correctly' do
      expect(Image.where(url: urls.last).pluck(:url)[0]).to eql("#{base_url}b737_1.jpg")
    end

  end

end
