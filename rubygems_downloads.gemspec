# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubygems_downloads/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubygems_downloads'
  spec.version       = RubygemsDownloads::VERSION
  spec.authors       = ['Florinel Gorgan']
  spec.email         = ['florin@floringorgan.com']

  spec.summary       = 'View statistics about gem downloads from RubyGems.org'
  spec.homepage      = 'https://github.com/laurentzziu/rubygems_downloads'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'callable_class'
  spec.add_dependency 'httparty', '>= 0.16.2', '< 0.22.0'
  spec.add_dependency 'terminal-table'
  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-console'
end
