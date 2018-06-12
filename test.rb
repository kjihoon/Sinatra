require_relative "algorithm.rb"
require 'test/unit'

class TestInteger < Test::Unit::TestCase
    @@integer_test = IntegerQuiz.new
    
    def test_evencheck
        assert_equal("Even",@@integer_test.evencheck(2))
        assert_equal("Odd",@@integer_test.evencheck(3))
    end
    
    def test_gl
        assert_equal([3,12],IntegerQuiz.new.gl(3,12))
    end
    
    def test_prime
        assert_equal(4,IntegerQuiz.new.prime_num(10))
    end
    
    
end