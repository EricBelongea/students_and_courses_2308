class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor, courses)
    @instructor = instructor
    @courses = courses
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    student_list = {}
    @courses.each do |course|
      student_list[course] = course.students
    end
    student_list
  end

  def students_below(threshold)
    insufficient = @courses.map do |course|
      course.students.select do |student|
        student.grade < threshold
      end
    end
    insufficient.flatten
  end

  def all_grades
    grades = {}
    @courses.each do |course|
      course.students.each do |student|
        grades[course] ||= []
        grades[course] += student.scores
      end
    end
    grades
  end

  def students_in_range(min, max)
    inrange =  @courses.map do |course|
      course.students.select do |student|
        student.grade >= min and student.grade <= max
      end
    end
    inrange.flatten
  end
end