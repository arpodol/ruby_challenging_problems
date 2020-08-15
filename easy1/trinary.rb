class Trinary
  def initialize(trinary_number)
    @trinary_string = trinary_number
  end

  def to_decimal
    return_value = 0
    trinary_arr = @trinary_string.split('')
    unless trinary_arr.all?{|char| /[0-2]/ =~ char}
      return return_value
    end
    trinary_arr.reverse.each_with_index do |int, index|
      return_value += (int.to_i * 3**(index))
    end
    return_value
  end
end

#Octal.new('10').to_decimal