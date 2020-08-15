class School
  def initialize
    @student_hash = {}
  end

  def add(name, grade)
    if @student_hash.include?(grade)
      @student_hash[grade] << name
      @student_hash[grade].sort!
    else
      @student_hash[grade] = [name]
    end
  end

  def to_h
    student_hash.sort.to_h
  end

  def grade(num)
    student_hash.fetch(num, [])
  end

  private
  attr_reader :student_hash

end