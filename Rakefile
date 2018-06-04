require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

# https://stackoverflow.com/a/23779044
task :console do
  exec "pry -r rubygems_downloads -I ./lib"
end

task :default => :spec
