class Prime
  def self.nth(int)
    raise ArgumentError if int == 0
    prime_count = 0
    outer_num = 2
    inner_num = 1
    while prime_count != int
      until inner_num == outer_num
        inner_num += 1
        if inner_num == outer_num
          prime_count += 1
        end
        break if outer_num % inner_num  == 0
      end
      outer_num += 1
      inner_num = 1
    end
    outer_num - 1
  end
end
