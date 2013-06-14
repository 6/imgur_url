require 'andand'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash/indifferent_access'
files = []
files.concat(Dir[File.join(File.dirname(__FILE__), 'imgur_url','**', '*.rb')])
files.each { |f| require f }
