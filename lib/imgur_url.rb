require 'andand'
require 'active_support/core_ext/string'
files = []
files.concat(Dir[File.join(File.dirname(__FILE__), 'imgur_url','**', '*.rb')])
files.each { |f| require f }
