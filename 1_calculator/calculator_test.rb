require "minitest/autorun"
require_relative "calculator"

class TestCalculator < Minitest::Test
  def test_add
    assert_equal 121, Calculator.add(59, 62)
  end

  def test_subtract
    assert_equal 33, Calculator.subtract(72, 39)
  end

  def test_multiply
    assert_equal 68, Calculator.multiply(4, 17)
  end

  def test_divide
    assert_equal 7, Calculator.divide(49, 7)
  end

  def test_divide_by_zero_raises_exception
    assert_raises ArgumentError do
      Calculator.divide(14, 0)
    end
  end

  def test_factorial
    assert_equal 120, Calculator.factorial(5)
  end

  def test_factorial_handles_edge_cases
    assert_equal 1, Calculator.factorial(0)
    assert_equal 1, Calculator.factorial(1)
  end

  def test_factorial_of_negative_number_raises_exception
    assert_raises ArgumentError do
      Calculator.factorial(-1)
    end
  end
end
