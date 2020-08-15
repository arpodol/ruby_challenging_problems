class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_array)
    word_array.select do |test_word|
      test_word.downcase.split('').sort == @word.downcase.split('').sort && test_word.downcase != @word.downcase
    end
  end
end