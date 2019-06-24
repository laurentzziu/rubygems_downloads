# frozen_string_literal: true

module RubygemsDownloads
  class Gem
    attr_accessor :name, :author, :total_downloads, :version_downloads, :version, :url

    def self.from_json(entry)
      new do |gem|
        gem.name = entry[:name]
        gem.total_downloads = entry[:downloads]
        gem.version_downloads = entry[:version_downloads]
        gem.version = entry[:version]
        gem.author = entry[:authors]
        gem.url = entry[:project_uri]
      end
    end

    def initialize
      yield self
    end

    def to_h
      {
        name: name,
        author: author,
        total_downloads: total_downloads,
        version_downloads: version_downloads,
        version: version,
        url: url
      }
    end

    def blank?
      !(name && author && total_downloads && version_downloads && version)
    end

    def ==(other)
      other.class == self.class && other.state == state
    end

    def state
      instance_variables.map { |variable| instance_variable_get(variable) }
    end
  end
end
