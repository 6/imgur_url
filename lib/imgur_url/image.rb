module ImgurUrl
  class Image
    attr_reader :original_url
    def initialize(url)
      @original_url = url
    end
  end
end
