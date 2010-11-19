require "Test/Unit"
require "TestUnitExtensions.rb"

require_relative "../Questioner.rb"

class QuestionerTester < Test::Unit::TestCase
  
  def setup
    @questioner = Questioner.new
  end
  
  def teardown
  end
  
  must "return true if yes_or_no gets yes" do # a little excessive?  ... yes
    %w{ yes YES YEs Yes YeS yeS y Y}.each do |y|
      assert @questioner.yes_or_no(y), "#{y.inspect} was expected to parse as true but did not"
    end
  end
  
  must "return false if yes_or_no gets no" do # a little excessive as well? ... yeah, I guess so
    %w{ no NO nO No n N }.each do |n|
      assert !@questioner.yes_or_no(n), "#{n.inspect} was expected to parse as false but did not"
    end
  end
  
  must "not raise an error if response is yes or no" do
    assert_nothing_raised do
      @questioner.yes_or_no "yes"
      @questioner.yes_or_no "no"
    end
  end
  
  must "raise an InvalidResponseError if the response is not yes or no" do
    %w{ blah hooHah YUMMY }.each do |word|
      assert_raises Questioner::InvalidResponseError do
        @questioner.yes_or_no word
      end
    end
  end
  
  must "respond 'Good, cheese is delicious!' when inquire_about_cheese gets yes" do
    def @questioner.ask(question); true; end # cheapo mock
    assert_equal "Good, cheese is delicious!", @questioner.inquire_about_cheese
  end
  
  must "respond 'WHAT!?? YOU DON'T LIKE CHEESE?' when inquire_about_cheese gets no" do
    def @questioner.ask(question); false; end # cheapo mock again
    assert_equal "WHAT!?? YOU DON'T LIKE CHEESE?", @questioner.inquire_about_cheese
  end
  
end
  