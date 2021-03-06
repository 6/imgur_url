Ruby gem for dealing with [imgur](http://imgur.com) image URLs. Install with `gem install imgur_url`

[![Build Status](https://secure.travis-ci.org/6/imgur_url.png?branch=master)](http://travis-ci.org/6/imgur_url)


#### Example usage
```ruby
i = ImgurUrl::Image.new("http://imgur.com/dhuY8")
i.id
# => "dhuY8"
i.url
# => "http://i.imgur.com/dhuY8.jpg"
i.url(:small)
# => "http://i.imgur.com/dhuY8s.jpg"
i.download_url
# => "http://imgur.com/download/dhuY8"
i.permalink_url
# => "http://imgur.com/dhuY8"
```

#### Recognized input URL formats
- `http://imgur.com/{image_id}`
- `http://i.imgur.com/{image_id}.jpg`
- `http://imgur.com/download/{image_id}`

#### Supported `url` sizes
- `:original` (default)
- `:huge` (1024px in largest dimension)
- `:large` (640px in largest dimension)
- `:medium` (320px in largest dimension)
- `:box` (160px/160px center-cropped)
- `:thumb` (160px in largest dimension)
- `:small` (90px/90px center-cropped)
