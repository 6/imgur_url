module ImgurUrl
  class Image
    attr_reader :original_url

    SIZES = {
      :small => 's',
      :thumb => 't',
      :medium => 'm',
      :large => 'l',
      :huge => 'h',
      :original => '',
    }

    def initialize(url)
      @original_url = url
    end

    def image_id
      @image_id ||= original_url.match(%r{imgur\.com/(?:(?:gallery|download)/)?([a-zA-Z0-9]+)[^/]*}).andand[1]
    end

    def permalink_url
      @permalink_url ||= "http://imgur.com/#{image_id}"
    end

    def direct_url(size = :original)
      @direct_urls ||= {}
      @direct_urls[size] ||= "http://i.imgur.com/#{image_id}#{SIZES[size]}.jpg"
    end

    def download_url
      @download_url ||= "http://imgur.com/download/#{image_id}"
    end
  end
end
