# frozen_string_literal: true

require 'thor'

module RubygemsDownloads
  module CLI
    class Handler < Thor
      desc 'author AUTHOR_USER_NAME', 'display gem downloads data for a specific author (username)'
      def author(name)
        RubygemsDownloads::CLI::Author.new(name).call
      end

      desc 'gem GEM_NAME', 'display downloads data for a specific gem'
      def gem(name)
        RubygemsDownloads::CLI::Gem.new(name).call
      end
    end
  end
end
