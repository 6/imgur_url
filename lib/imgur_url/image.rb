module ImgurUrl
  class Image
    attr_reader :original_url
    def initialize(url)
      @original_url = url
    end

    def image_id
      @image_id ||= original_url.match(%r{imgur\.com/(?:(?:gallery|download)/)?([a-zA-Z0-9]+)[^/]*}).andand[1]
    end

    def permalink_url
      @permalink_url ||= "http://imgur.com/#{image_id}"
    end

    def direct_url
      @direct_url ||= "http://i.imgur.com/#{image_id}.jpg"
    end

    def download_url
      @download_url ||= "http://imgur.com/download/#{image_id}"
    end
  end
end
