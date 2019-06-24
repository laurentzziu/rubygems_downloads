# frozen_string_literal: true

module RubygemsDownloads
  module Stats
    class Gem < Base
      def call
        response = super

        return invalid_response_return_value if response.nil?

        RubygemsDownloads::Gem.from_json(response)
      end

      protected

      def placeholder
        '#|GEM_NAME|#'
      end

      def endpoint
        "https://rubygems.org/api/v1/gems/#{placeholder}.json"
      end

      def invalid_response_return_value
        nil
      end
    end
  end
end
