[![Build Status](https://travis-ci.org/laurentzziu/rubygems_downloads.svg?branch=master)](https://travis-ci.org/laurentzziu/rubygems_downloads)
[![Gem Version](https://badge.fury.io/rb/rubygems_downloads.svg)](https://rubygems.org/gems/rubygems_downloads)
[![Maintainability](https://api.codeclimate.com/v1/badges/8236c6291fe8d7cb7521/maintainability)](https://codeclimate.com/github/laurentzziu/rubygems_downloads/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8236c6291fe8d7cb7521/test_coverage)](https://codeclimate.com/github/laurentzziu/rubygems_downloads/test_coverage)

# RubyGems Downloads

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubygems_downloads'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubygems_downloads

## Usage

### CLI Usage

#### Get information about a specific author's gems
```bash
rubygems_downloads author laurentzziu # (that's me)
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | # | Gem Name             | Total Downloads | Version Downloads | Current Version | Author          |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 1 | hash2lrtemplate      | 30              | 30                | 0.1.0           | Florinel Gorgan |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 2 | procreate-swatches   | 588             | 279               | 0.1.2           | Florinel Gorgan |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 3 | permitted_attributes | 388             | 388               | 0.1.0           | Florin Gorgan   |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 4 | acv2lrtemplate       | 1055            | 427               | 0.2.1           | Florinel Gorgan |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 5 | universities         | 375             | 214               | 0.1.1           | Florinel Gorgan |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 6 | callable_class       | 429             | 260               | 0.1.1           | Florinel Gorgan |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
# | 7 | to_human             | 213             | 213               | 0.1.0           | Florinel Gorgan |
# +---+----------------------+-----------------+-------------------+-----------------+-----------------+
```

```bash
rubygems_downloads gem callable_class # (that's my gem)
# +---+----------------+-----------------+-------------------+-----------------+-----------------+
# | # | Gem Name       | Total Downloads | Version Downloads | Current Version | Author          |
# +---+----------------+-----------------+-------------------+-----------------+-----------------+
# | 1 | callable_class | 435             | 264               | 0.1.1           | Florinel Gorgan |
# +---+----------------+-----------------+-------------------+-----------------+-----------------+
```

### Code usage
First, require the gem:
```ruby
require 'rubygems_downloads'
```

Then use the needed functionality:

```ruby
RubygemsDownloads.for_author('laurentzziu')
# which is the same as calling
RubygemsDownloads::Stats::Author.call('laurentzziu')

# => [#<RubygemsDownloads::Gem:0x007fa856c2a730 @author="Florinel Gorgan", @name="hash2lrtemplate", @total_downloads=156, @url="https://rubygems.org/gems/hash2lrtemplate", @version="0.1.0", @version_downloads=156>,
#  #<RubygemsDownloads::Gem:0x007fa856c2a708 @author="Florinel Gorgan", @name="procreate-swatches", @total_downloads=635, @url="https://rubygems.org/gems/procreate-swatches", @version="0.1.2", @version_downloads=302>,
#  #<RubygemsDownloads::Gem:0x007fa856c2a6e0 @author="Florin Gorgan", @name="permitted_attributes", @total_downloads=393, @url="https://rubygems.org/gems/permitted_attributes", @version="0.1.0", @version_downloads=393>,
#  #<RubygemsDownloads::Gem:0x007fa856c2a6b8 @author="Florinel Gorgan", @name="acv2lrtemplate", @total_downloads=1062, @url="https://rubygems.org/gems/acv2lrtemplate", @version="0.2.1", @version_downloads=430>,
#  #<RubygemsDownloads::Gem:0x007fa856c2a690 @author="Florinel Gorgan", @name="universities", @total_downloads=384, @url="https://rubygems.org/gems/universities", @version="0.1.1", @version_downloads=220>,
#  #<RubygemsDownloads::Gem:0x007fa856c2a668 @author="Florinel Gorgan", @name="callable_class", @total_downloads=435, @url="https://rubygems.org/gems/callable_class", @version="0.1.1", @version_downloads=264>,
#  #<RubygemsDownloads::Gem:0x007fa856c2a640 @author="Florinel Gorgan", @name="to_human", @total_downloads=219, @url="https://rubygems.org/gems/to_human", @version="0.1.0", @version_downloads=219>]
```

```ruby
RubygemsDownloads.for_gem('callable_class')
# which is the same as calling
RubygemsDownloads::Stats::Gem.call('callable_class')

# => #<RubygemsDownloads::Gem:0x007fa8559a86c0 @author="Florinel Gorgan", @name="callable_class", @total_downloads=435, @url="https://rubygems.org/gems/callable_class", @version="0.1.1", @version_downloads=264>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/laurentzziu/rubygems_downloads. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the _RubygemsDownloads_ project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/laurentzziu/rubygems_downloads/blob/master/CODE_OF_CONDUCT.md).
