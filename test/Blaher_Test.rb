require "Test/Unit"
require "TestUnitExtensions.rb"

require_relative "../Blaher.rb"

class BlahTester < Test::Unit::TestCase
  must "have BLAH by default" do
    b = Blaher.new
    assert_equal("BLAH", b.word)
  end
end
