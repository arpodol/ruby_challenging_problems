class Series
  def initialize(number)
    @number = number.split('').map { |int| int.to_i}
  end

  def slices(increments)
    raise ArgumentError if increments > @number.length
    slice_array = []
    counter = 0
    while counter <= @number.length - increments
      slice_array << @number[counter..(counter + increments - 1)]
      counter += 1
    end
    slice_array
  end
end
