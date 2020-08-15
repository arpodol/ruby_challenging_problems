class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @time = hour * MINUTES_PER_HOUR + minute
  end

  def to_s
    hour = @time / MINUTES_PER_HOUR
    minute = @time % MINUTES_PER_HOUR
    "%02d:%02d" % [hour, minute]
  end

  def +(minute)
    @time += minute
    rollover
    self
  end

  def -(minute)
    @time -=minute
    rollover
    self
  end

  def rollover
    @time %= MINUTES_PER_DAY
  end

  def ==(other)
    other.time == self.time
  end

  protected
  attr_reader :time

end