# frozen_string_literal: true

require 'httparty'

module RubygemsDownloads
  module Stats
    class Author < Base
      def call
        response = super

        return invalid_response_return_value if response.nil?

        response.map do |entry|
          RubygemsDownloads::Gem.from_json(entry)
        end
      end

      protected

      def placeholder
        '#|AUTHOR_NAME|#'
      end

      def endpoint
        "https://rubygems.org/api/v1/owners/#{placeholder}/gems.json"
      end

      def invalid_response_return_value
        []
      end
    end
  end
end
