# frozen_string_literal: true

module RubygemsDownloads
  module CLI
    class Gem < Base
      private

      def error_message
        'Gem not found.'
      end

      def retrieve_data
        @data = Stats::Gem.call(@name)
      end

      def rows
        return nil unless @data.present?

        [
          [1, *data_from_gem(@data)]
        ]
      end
    end
  end
end
