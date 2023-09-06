class Student
  attr_reader :name, :age, :scores

  def initialize(person)
    @name = person[:name]
    @age = person[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    @scores.sum(0.0) / @scores.size
  end
end
