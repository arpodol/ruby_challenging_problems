class PhoneNumber
  def initialize(number)
    @phone_number = number
  end

  def number
    invalid_num = '0000000000'
    return invalid_num if @phone_number =~ /[a-zA-Z]/

    scrubbed_num_ar = @phone_number.scan(/\d/)
    return invalid_num if scrubbed_num_ar.length < 10 || scrubbed_num_ar.length > 11

    if scrubbed_num_ar.length == 11
      if scrubbed_num_ar[0] == '1'
        return scrubbed_num_ar[1..-1].join
      end
      return invalid_num
    end
    return scrubbed_num_ar.join
  end

  def area_code
    number.chars[0..2].join
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end