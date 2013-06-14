module ImgurUrl
  class Image
    SIZES = {
      :small => 's',
      :thumb => 't',
      :medium => 'm',
      :large => 'l',
      :huge => 'h',
      :original => '',
    }

    ALBUM_PATH = "a"

    def initialize(url)
      @original_url = url
      unless id.present? && id != ALBUM_PATH
        raise InvalidUrl
      end
    end

    def id
      @id ||= @original_url.match(%r{imgur\.com/(?:(?:gallery|download)/)?([^.#?/]+)}).andand[1]
    end

    def url(size = :original)
      raise InvalidSize  unless SIZES[size]
      @direct_urls ||= {}
      @direct_urls[size] ||= "http://i.imgur.com/#{id}#{SIZES[size]}.jpg"
    end

    def permalink_url
      @permalink_url ||= "http://imgur.com/#{id}"
    end

    def download_url
      @download_url ||= "http://imgur.com/download/#{id}"
    end
  end
end
