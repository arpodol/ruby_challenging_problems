class Palindromes
  def initialize(max_factor: 0, min_factor: 1)
    @largest = nil
    @smallest = nil
    @max = max_factor
    @min = min_factor
  end

  def generate
    @min.upto(@max) do |first_num|
      @min.upto(@max) do |second_num|
        product = first_num * second_num
        next unless palindrome?(product)

        if @largest.nil?
          @largest = Palindrome.new(product, [first_num, second_num])
          @smallest = Palindrome.new(product, [first_num, second_num])
          next
        end

        if product == @largest.value
          @largest.add_factor([first_num, second_num])
        elsif product == @smallest.value
          @smallest.add_factor([first_num, second_num])
        elsif product > @largest.value
          @largest = Palindrome.new(product,[first_num, second_num] )
        elsif product < @smallest.value
          @smallest = Palindrome.new(product,[first_num, second_num] )
        end
      end
    end
  end

  def largest
    @largest
  end

  def smallest
    @smallest
  end

  def palindrome?(num)
    num.digits == num.digits.reverse
  end
end


class Palindrome
  attr_reader :value
  def initialize(value, factors)
    @value = value
    @factors = [factors]
  end

  def add_factor(factors)
    @factors << factors.sort
  end

  def factors
    @factors.uniq
  end
end
