class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      char_arr = word.chars
      vowels = ['a', 'e', 'i', 'o', 'u']

      sel_chunk = []

      char_arr.each do |letter|
        sel_chunk << letter if letter == 'u' && sel_chunk.last == 'q'
        break if vowels.include?(letter)
        sel_chunk << letter
      end

      if %w[y x].include?(sel_chunk[0]) && sel_chunk.length == 1
        (char_arr[1..-1] + sel_chunk).join('') + 'ay'
      elsif sel_chunk.empty? || (%w[y x].include?(sel_chunk[0]) && !vowels.include?(sel_chunk[1]))
        word  + 'ay'
      else
        (char_arr[sel_chunk.length..-1] + sel_chunk).join('') + 'ay'
      end
    end.join(' ')
  end
end

PigLatin.translate('yellow')

