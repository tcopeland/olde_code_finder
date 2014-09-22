require 'test/unit'
require 'olde_code_finder'

class FinderTest < Test::Unit::TestCase

  def test_constructor
    assert OldeCodeFinder::Finder.new("test.rb", 90)
  end

end