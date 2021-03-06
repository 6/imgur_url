# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'imgur_url/version'

Gem::Specification.new do |gem|
  gem.name          = "imgur_url"
  gem.authors       = ["Peter Graham"]
  gem.version       = ImgurUrl::VERSION
  gem.summary       = %q{Parse imgur URLs}
  gem.description   = %q{Parse imgur.com image URLs.}
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.homepage = 'http://github.com/6/imgur_url'

  gem.add_dependency "andand"
  gem.add_dependency "activesupport"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency 'rspec-nc'
end
