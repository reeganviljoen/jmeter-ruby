require 'bundler/gem_tasks'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
namespace :coverage do
  task :report do
    require "simplecov"
    require "simplecov-consimplecovsole"

    SimpleCov.minimum_coverage 100

    SimpleCov.collate Dir["{coverage,simplecov-resultset-*}/.resultset.json"], "rails" do
      formatter SimpleCov::Formatter::Console
    end
  end
end

task default: [:spec]
