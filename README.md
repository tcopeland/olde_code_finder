# OldeCodeFinder

OldeCodeFinder finds old code.  This means files which are largely older than a specific date.

It can also find files which were mostly written by a particular person.  So if Fred left the company 3 years ago, files which consist mostly of lines which were written by him may be worth revisiting.

## Installation

Add this line to your application's `Gemfile` in the 'development' group:

    gem 'olde_code_finder'

## Usage

See if more than 80% of `app/models/foo.rb` was written by Benjamin Franklin:

    bundle exec rake olde_code_finder:find_by_author['app/models/foo.rb','Benjamin Franklin','80']

Or you can use a glob:

    bundle exec rake olde_code_finder:find_by_author['app/models/*.rb','Benjamin Franklin','80']

Or you can specify a lower percentage threshold:

    bundle exec rake olde_code_finder:find_by_author['app/models/*.rb','Benjamin Franklin','60']

The author name is a regex, so this will find 'Benjamin Franklin' as well as 'Ben Franklin':

    bundle exec rake olde_code_finder:find_by_author['app/models/*.rb','Frank','80']

Or you can run a different task and find code older than a certain date instead:    

    bundle exec rake olde_code_finder:find_by_date['app/models/*.rb','4 years','80']

The output will be a list of files that meet the criteria:

    foo> $ bundle exec rake olde_code_finder:find_by_author['app/models/*.rb','Benjamin Franklin','80']
    More than 80% of app/models/foobar.rb was written by Benjamin Franklin (85%)

## How does it work?

It uses `git blame` to see who last touched each line of a file and when.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/olde_code_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

* Tom Copeland: Author
* Joe Rafaniello: Added percentage display
