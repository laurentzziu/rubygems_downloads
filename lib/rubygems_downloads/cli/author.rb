# frozen_string_literal: true

module RubygemsDownloads
  module CLI
    class Author < Base
      private

      def error_message
        'User not found.'
      end

      def retrieve_data
        @data = Stats::Author.call(@name)
      end

      def rows
        return nil unless @data.present?

        @data.map.with_index(1) do |gem, index|
          [
            index,
            *data_from_gem(gem)
          ]
        end
      end
    end
  end
end
