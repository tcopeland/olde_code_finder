# OldeCodeFinder

OldeCodeFinder finds files which were mostly written by a particular person.  So if Fred left the company 3 years ago,
files which consist mostly of lines which were written by him made be worth revisiting.

## Installation

Add this line to your application's `Gemfile` in the 'development' group:

    gem 'olde_code_finder'

And add this to your `Rakefile`:

    begin; require 'olde_code_finder/tasks'; rescue LoadError; end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install olde_code_finder

## Usage

See if more than 80% of `app/models/foo.rb` was written by Benjamin Franklin:

    bundle exec rake olde_code_finder:find['app/models/foo.rb','Benjamin Franklin','80']

Or you can use a glob:

    bundle exec rake olde_code_finder:find['app/models/*.rb','Benjamin Franklin','80']

Or you can specify a lower percentage threshold:

    bundle exec rake olde_code_finder:find['app/models/*.rb','Benjamin Franklin','60']

The author name is a regex, so this will find 'Benjamin Franklin' as well as 'Ben Franklin':

    bundle exec rake olde_code_finder:find['app/models/*.rb','Frank','80']

The output will be a list of files that meet the criteria:

    foo> $ bundle exec rake olde_code_finder:find['app/models/*.rb','Benjamin Franklin','80']
    More than 80% of app/models/foobar.rb was written by Benjamin Franklin

## How does it work?

It uses `git blame` to see who last touched each line of a file.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/olde_code_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
