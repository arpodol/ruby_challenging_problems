require 'date'

class Meetup
  DAYHASH = {    :sunday => 0,
                 :monday => 1,
                 :tuesday => 2,
                 :wednesday => 3,
                 :thursday => 4,
                 :friday => 5,
                 :saturday => 6
  }

  def initialize(month, year)
    @primal_date = Date.new(year, month)
  end

  def day(weekday,schedule)
    case schedule
      when :teenth
        teenth(weekday)
      when :first
        first_day(weekday)
      when :second
        second(weekday)
      when :third
        third(weekday)
      when :fourth
        fourth(weekday)
      when :last
        last_day(weekday)
    end
  end

  def teenth(weekday)
    teenth_day = @primal_date
    until teenth_day.wday == DAYHASH[weekday] && teenth_day.mday > 12
      teenth_day += 1
    end
    teenth_day
  end

  def first_day(weekday)
    teenth_day = @primal_date
    until teenth_day.wday == DAYHASH[weekday]
      teenth_day += 1
    end
    teenth_day
  end

  def second(weekday)
    first_day(weekday) + 7
  end

  def third(weekday)
    first_day(weekday) + 14
  end

  def fourth(weekday)
    first_day(weekday) + 21
  end

  def last_day(weekday)
    last__day = @primal_date.next_month - 1
    until last__day.wday == DAYHASH[weekday]
      last__day -= 1
    end
    last__day
  end
end

#Meetup.new(4, 2013).day(:monday, :last)