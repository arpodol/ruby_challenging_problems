class SecretHandshake
  def initialize(int)
    if int.is_a? Numeric
      @binary = int.to_i.digits(2).reverse
    else
      @binary = int.chars.map{|bit| bit.to_i}
    end

    @code_array = ['wink', 'double blink', 'close your eyes', 'jump']
  end

  def commands
    pad!(@binary, 5, 0)

    return_array = []
    @binary[1..4].reverse.each_with_index do | value, idx |
      return_array << @code_array[idx] if value == 1
    end
    @binary[0] == 1 ? return_array.reverse : return_array
  end

  def pad!(array, size, pad_value)
    array.unshift(pad_value) while array.length < size
  end
end
