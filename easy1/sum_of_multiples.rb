class SumOfMultiples

  @@factor_array = [3, 5]
  def initialize(factor1 = 3, factor2 = 5, *remaining_factors)
    @factor_array = [factor1, factor2, *remaining_factors]
  end

  def self.to(end_point)
    common_to(end_point, @@factor_array)
  end

  def to(end_point)
    self.class.common_to(end_point, @factor_array)
  end

  def self.common_to(end_point, factor_array)
    return_value = 0
    1.upto(end_point-1).each{|int| return_value += int if factor_array.any?{|factor| int % factor == 0}}
    return_value
  end
end
