class Sieve
  def initialize(upper_limit)
    @upper_limit = upper_limit
    @range = []
    (2..upper_limit).each { |index| @range << [index, :untagged] }
  end

  def primes
    prime_array = []
    @range.each_with_index do |integer_chunk, index|
      if integer_chunk[1] == :untagged
        prime_array << integer_chunk[0]
        (index..@upper_limit).each do |inner_index|
          if @range[inner_index - 2][0] % integer_chunk[0] == 0
            @range[inner_index - 2][1] = :tagged
          end
        end
      else
        next
      end
    end
    prime_array
  end

end

test = Sieve.new(100)
test.primes