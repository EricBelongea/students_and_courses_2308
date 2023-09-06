require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  it 'exists' do 
    gradebook = Gradebook.new("Abdul", [])

    expect(gradebook).to be_instance_of Gradebook
  end

  it 'has attributes' do
    gradebook = Gradebook.new("Abdul", [])

    expect(gradebook.instructor).to eq("Abdul")
    expect(gradebook.courses).to eq([])
  end

  it 'can hold course objects' do
    gradebook = Gradebook.new("Abdul", [])
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("English", 4)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end

  it 'can list students in a course' do
    gradebook = Gradebook.new("Abdul", [])
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course.enroll(student1)
    course.enroll(student2)
    gradebook.add_course(course)

    expect(gradebook.courses).to eq([course])
    
    expect(gradebook.list_all_students).to eq({course => [student1, student2]})
    expect(gradebook.list_all_students.keys).to eq([course])
    expect(gradebook.list_all_students.values).to eq([[student1, student2]])
  end
  
  it 'will return students below threshold' do
    gradebook = Gradebook.new("Abdul", [])
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    
    course.enroll(student1)
    course.enroll(student2)
    gradebook.add_course(course)
    
    student1.log_score(85)
    student1.log_score(80)
    student1.log_score(70)
    
    student2.log_score(99)
    student2.log_score(85)
    student2.log_score(78)
    
    # require'pry';binding.pry
    expect(gradebook.students_below(80)).to eq([student1])
  end
end