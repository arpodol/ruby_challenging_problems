def dump_buffer(buffer)
  unless buffer.empty?
    buffer.reverse!
    buffer.length.times { puts buffer.shift }
  end
end

def reverse_odd_words(string)
  odd_word_buffer = []
  empty_space = true
  even_word = false
  first_word = true

  string.chars.each do |char|
    if first_word && char == ' '
      next
    else
      first_word = false
    end

    if char == ' '
      empty_space = true
    elsif char == '.'
      puts char
    else
      if empty_space
        even_word = even_word == false
        dump_buffer(odd_word_buffer)
        empty_space = false
      end
      if even_word
        puts char
        next
      else
        odd_word_buffer << char
      end
    end
  end

end
puts 'tst'
reverse_odd_words(' whats  the  matter  with  kansas .')
#reverse_odd_words('whats up with kansas.') == 'whats pu with sasnak.'