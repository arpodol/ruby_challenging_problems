class Octal
  def initialize(octal_number)
    @octal_string = octal_number
  end

  def to_decimal
    return_value = 0
    octal_arr = @octal_string.split('')
    unless octal_arr.all?{|char| /[0-7]/ =~ char}
      return return_value
    end
    octal_arr.reverse.each_with_index do |int, index|
      return_value += (int.to_i * 8**(index))
    end
    return_value
  end
end