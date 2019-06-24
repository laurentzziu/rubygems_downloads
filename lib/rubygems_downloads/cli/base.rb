# frozen_string_literal: true

require 'terminal-table'
require 'pry'

module RubygemsDownloads
  module CLI
    class Base
      def initialize(name)
        @name = name
      end

      def call
        retrieve_data
        generate_table_data
      end

      protected

      TABLE_HEADER = ['#', 'Gem Name', 'Total Downloads', 'Version Downloads', 'Current Version', 'Author'].freeze

      def generate_table_data
        return error_message unless rows.present?

        Terminal::Table.new(headings: TABLE_HEADER, rows: rows, style: { all_separators: true })
      end

      def data_from_gem(gem)
        gem.to_h.values_at(:name, :total_downloads, :version_downloads, :version, :author)
      end
    end
  end
end
