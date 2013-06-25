module ImgurUrl
  class Image
    SIZES = {
      :small => 's',
      :thumb => 't',
      :box => 'b',
      :medium => 'm',
      :large => 'l',
      :huge => 'h',
      :original => '',
    }

    IGNORE_PATHS = %w[
      gallery
      removalrequest
    ]

    def initialize(url)
      @original_url = url
      raise InvalidUrl  unless id.present? && !IGNORE_PATHS.include?(id)
    end

    def id
      @id ||= @original_url.match(%r{^http://(?:i\.)?imgur\.com/(?:download/)?([^.#?/]{5,})}).andand[1]
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
