require 'nokogiri'
require 'rest_client'
require 'json'
require 'cgi'
require 'open3'

require 'jmeter-ruby/version'

lib = File.dirname(File.absolute_path(__FILE__))

Dir.glob(lib + '/jmeter-ruby/helpers/**/*.rb').each do |file|
  require file
end

Dir.glob(lib + '/jmeter-ruby/dsl/**/*.rb').each do |file|
  require file
end

Dir.glob(lib + '/jmeter-ruby/extend/**/*.rb').each do |file|
  require file
end

Dir.glob(lib + '/jmeter-ruby/plugins/**/*.rb').each do |file|
  require file
end

require 'jmeter-ruby/dsl'
