class PerfectNumber
  def self.classify(int)
    raise RuntimeError if int < 0
    sum_of_f = (1..int-1).select{|i| int % i == 0}.inject(:+)
    case
      when sum_of_f < int then 'deficient'
      when sum_of_f == int then 'perfect'
      when sum_of_f > int then 'abundant'
    end
  end
end