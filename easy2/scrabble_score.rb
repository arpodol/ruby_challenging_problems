class Scrabble
  SCRABBLE_HASH = {1 => %w(A E I O U L N R S T),
                   2 => %w(D G),
                   3 => %w(B C M P),
                   4 => %w(F H V W Y),
                   5 => %w(K),
                   8 => %w(J X),
                   10 => %w(Q Z)}

  def initialize(word)
    word == nil ? @word = ' ' : @word = word
  end

  def score
    return_score = 0
    @word.chars.each do |letter|
      SCRABBLE_HASH.each do |k,v|
        if v.include?(letter.upcase)
          return_score += k
          next
        end
      end
    end
    return_score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end