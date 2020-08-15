class Integer
  def to_roman
    thousands_hash = {1 => 'M',
                      2 => 'MM',
                      3 => 'MMM' }

    hundreds_hash = { 1 => 'C',
                      2 => 'CC',
                      3 => 'CCC',
                      4 => 'CD',
                      5 => 'D',
                      6 => 'DC',
                      7 => 'DCC',
                      8 => 'DCCC',
                      9 => 'CM' }

    tens_hash = { 1 => 'X',
                  2 => 'XX',
                  3 => 'XXX',
                  4 => 'XL',
                  5 => 'L',
                  6 => 'LX',
                  7 => 'LXX',
                  8 => 'LXXX',
                  9 => 'XC' }

    ones_hash = { 1 => 'I',
                  2 => 'II',
                  3 => 'III',
                  4 => 'IV',
                  5 => 'V',
                  6 => 'VI',
                  7 => 'VII',
                  8 => 'VIII',
                  9 => 'IX'}



    thousands = self / 1000
    hundreds = (self - (thousands * 1000)) / 100
    tens = (self - (thousands * 1000) - (hundreds * 100)) / 10
    ones = self % 10


    [thousands_hash[thousands], hundreds_hash[hundreds], tens_hash[tens], ones_hash[ones]].join
  end
end
27.to_roman