class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    self.class.addends(@number.to_s.split(''))
  end

  def self.addends(num_array)
    digit_array = num_array.reverse.each_with_index.map do |string, index|
      return_int = string.to_i
      if index.odd?
        return_int *= 2
        return_int -= 9 if return_int > 10
      end
      return_int
    end
    digit_array.reverse
  end

  def checksum
    self.class.checksum(addends)
  end

  def self.checksum(addends)
    addends.inject(:+)
  end

  def valid?
    self.class.valid?(checksum)
  end

  def self.valid?(checksum)
    checksum.to_s.chars[-1] == '0'
  end

  def self.remainder(checksum)
    (checksum % 10).zero? ? 0 : 10 - checksum % 10
  end

  def self.create(partial)
    temp_array = partial.to_s.split('') << '0'
    last_digit = remainder(checksum(addends(temp_array)))
    temp_array[-1] = last_digit
    temp_array.join('').to_i
  end
end