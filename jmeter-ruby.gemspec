# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jmeter-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = 'jmeter-ruby'
  gem.version       = JmeterRuby::VERSION::STRING
  gem.authors       = ['Reegan Viljoen']
  gem.email         = ['reeganviljoen@outlook.com']
  gem.description   = %q{Ruby based DSL for writing JMeter test plans}
  gem.summary       = %q{Ruby based DSL for writing JMeter test plans}
  gem.homepage      = 'https://github.com/reeganviljoen/jmeter-ruby/issues'
  gem.required_ruby_version = ">= 3.1.0"

  gem.add_dependency 'rest-client'
  gem.add_dependency 'nokogiri'
  gem.add_runtime_dependency('json-jruby') if RUBY_PLATFORM == 'java'

  gem.add_development_dependency "simplecov", "~> 0.22.0"
  gem.add_development_dependency "simplecov-console", "~> 0.9.1"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.license       = 'MIT'
end
