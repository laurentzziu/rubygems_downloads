require 'httparty'

module RubygemsDownloads
  module Stats
    class Author
      def self.for(author)
        response = HTTParty.get("https://rubygems.org/api/v1/owners/#{author}/gems.json", format: :plain)
        response = JSON.parse(response, symbolize_names: true)
        response.map do |gem| 
          hash = {}
          hash[gem[:name].to_sym] = { 
            total_downloads: gem[:downloads], 
            version_downloads: gem[:version_downloads] 
          }
          hash 
        end
      end
    end
  end
end