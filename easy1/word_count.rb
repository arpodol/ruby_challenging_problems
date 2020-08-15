class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    freq_hash = {}
    @text.scan(/\w+'*\w{1}|\w/).each do |word|
      if freq_hash.include?(word.downcase)
        freq_hash[word.downcase] += 1
      else
        freq_hash[word.downcase] = 1
      end
    end
    freq_hash
  end
end