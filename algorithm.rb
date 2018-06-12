require_relative "q1.rb"
require 'test/unit'

class TestInteger < Test::Unit::TestCase
    @@integer_test = IntegerQuiz.new
    
    def test_evencheck
        assert_equal("Even",@@integer_test.evencheck(2))
        assert_equal("Odd",@@integer_test.evencheck(3))
    end
end