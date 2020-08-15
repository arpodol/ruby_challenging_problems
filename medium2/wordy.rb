class WordProblem
  @@method_hash = {
    'plus' => '+',
    'minus' => '-',
    'multiplied by' => '*',
    'divided by' => '/'
  }
  def initialize(problem)
    @problem_array = sanitize(problem)
  end

  def sanitize(sentence)
    clean_sentence = sentence.delete('?').gsub('What is','')
    @@method_hash.each { |k, v| clean_sentence.gsub!(k, v) }
    clean_sentence.split(' ')
  end

  def answer
    validate_sentence(@problem_array)
    total = @problem_array.shift.to_i
    @problem_array.each_slice(2) do |sub_arr|
      total = total.send(sub_arr[0], sub_arr[1].to_i)
    end
    total
  end

  def validate_sentence(sentence)
    raise ArgumentError if sentence.join =~ /[^\d\+\-\/\*\s]/
  end



end