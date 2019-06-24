# frozen_string_literal: true

require_relative 'core_ext/object'
require_relative 'core_ext/hash'

require_relative 'rubygems_downloads/version'

require_relative 'rubygems_downloads/gem'

require_relative 'rubygems_downloads/stats/base'
require_relative 'rubygems_downloads/stats/author'
require_relative 'rubygems_downloads/stats/gem'

require_relative 'rubygems_downloads/cli/base'
require_relative 'rubygems_downloads/cli/handler'
require_relative 'rubygems_downloads/cli/author'
require_relative 'rubygems_downloads/cli/gem'

module RubygemsDownloads
  def self.for_author(author_name)
    RubygemsDownloads::Stats::Author.call(author_name)
  end

  def self.for_gem(gem_name)
    RubygemsDownloads::Stats::Gem.call(gem_name)
  end
end
