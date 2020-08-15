class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @circular_buffer = []
    @size = size
  end

  def write(entry)
    if @circular_buffer.length < @size
      @circular_buffer << entry unless entry.nil?
    else
      raise(BufferFullException)
    end
  end

  def read
    raise(BufferEmptyException) if @circular_buffer.empty?
    @circular_buffer.shift
  end

  def write!(entry)
    return if entry.nil?
    @circular_buffer.shift if @circular_buffer.length >= @size
    write(entry)
  end

  def clear
    @circular_buffer = []
  end
end