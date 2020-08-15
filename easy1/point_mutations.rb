class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(test_string)
    hamming_distance = 0
    strand_ar = @strand.chars
    test_ar = test_string.chars
    test_length = [test_ar.length, strand_ar.length].min - 1
    (0..test_length).each {|idx| hamming_distance += 1 if test_ar[idx] != strand_ar[idx]}
    hamming_distance
  end
end

