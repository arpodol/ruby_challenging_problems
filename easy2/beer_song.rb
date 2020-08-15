class BeerSong

  def initialize
    @verses = []
    empty_verse = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    @verses << empty_verse
    first_verse = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    @verses << first_verse
    second_verse = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    @verses << second_verse
    (3..99).each do |num|
      @verses << "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
    end
  end

  def verse(num)
    @verses[num]
  end

  def verses(num, num2)
    return_string = ''
    num.downto(num2).each do |verse|
      return_string += @verses[verse]
      if verse != num2
        return_string += "\n"
      end
    end
    return_string
  end

  def lyrics
    verses(99, 0)
  end
end