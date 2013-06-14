Ruby gem for dealing with [imgur](http://imgur.com) image URLs.

[![Build Status](https://secure.travis-ci.org/6/imgur_url.png?branch=master)](http://travis-ci.org/6/imgur_url)


#### Example usage
```ruby
i = ImgurUrl::Image.new("http://imgur.com/dhuY8")
i.id
# => "dhuY8"
i.url(:original)
# => "http://i.imgur.com/dhuY8.jpg"
i.url(:medium)
# => "http://i.imgur.com/dhuY8m.jpg"
i.download_url
# => "http://imgur.com/download/dhuY8"
```

#### Recognized input URL formats
- `http://imgur.com/{image_id}`
- `http://i.imgur.com/{image_id}.jpg`
- `http://imgur.com/download/{image_id}`
- `http://imgur.com/gallery/{image_id}`
