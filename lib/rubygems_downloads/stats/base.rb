# frozen_string_literal: true

require 'httparty'
require 'callable_class'

module RubygemsDownloads
  module Stats
    class Base
      include CallableClass

      attr_reader :name

      def initialize(name)
        @name = name

        raise(ArgumentError, '`name` parameter invalid.') unless name.present?
      end

      def call
        response = HTTParty.get(url, format: :plain)

        return nil if response.code == 404

        JSON.parse(response, symbolize_names: true)
      end

      protected

      def url
        endpoint.sub(placeholder, name)
      end
    end
  end
end
