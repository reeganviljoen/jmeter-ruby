require 'rubygems'
require 'rspec'
require "simplecov"
require "simplecov-console"

if ENV["MEASURE_COVERAGE"]
  SimpleCov.start do
    command_name "simplecov-resultset-ruby#{RUBY_VERSION}"

    formatter SimpleCov::Formatter::Console
  end
end
test_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift test_dir unless $LOAD_PATH.include?(test_dir)

lib_dir = File.join(File.dirname(test_dir), 'lib')
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'jmeter-ruby'
