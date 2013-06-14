module ImgurUrl
  class Exception < StandardError
  end

  class InvalidSize < ImgurUrl::Exception
  end
end
