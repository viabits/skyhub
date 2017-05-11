module WebService
  class Images
    def initialize(url = Settings.images[:url])
      @url = url
    end

    def urls
      hash_images = JSON.parse response_from_web_service
      hash_images['images'].map{ |image| image['url'] }
    end

    private
    def response_from_web_service
      response = Typhoeus.get @url
      response.body
    end

  end

end
