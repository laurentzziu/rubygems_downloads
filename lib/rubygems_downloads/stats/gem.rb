require 'httparty'

module RubygemsDownloads
  module Stats
    class Gem
      def self.for(gem_name, version = "0.1.0")
        response = HTTParty.get("https://rubygems.org/api/v1/downloads/#{gem_name}-#{version}.json", format: :plain)
        response = JSON.parse(response, symbolize_names: true)
        [[gem_name, response]].to_h
      end
    end
  end
end