module ImgurUrl
  class Exception < StandardError
  end

  class InvalidUrl < ImgurUrl::Exception
  end

  class InvalidSize < ImgurUrl::Exception
  end
end
