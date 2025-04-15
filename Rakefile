require 'bundler/gem_tasks'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
namespace :coverage do
  task :report do
    require "simplecov"
    require "simplecov-console"

    SimpleCov.minimum_coverage 75

    SimpleCov.collate Dir["{coverage,simplecov-resultset-*}/.resultset.json"] do
      formatter SimpleCov::Formatter::Console
    end
  end
end

task default: [:spec]
