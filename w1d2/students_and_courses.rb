class Student

  attr_accessor :first_name, :last_name, :courses

  def initialize(first, last)
    @first_name = first
    @last_name = last
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(course)
    @courses << course
  end

  def course_load
    to_return = {}
    @courses.each do |course|
      if to_return.has_key?(course.department)
        to_return[course.department] += course.credits
      else
        to_return[course.department] = course.credits
      end
    end
    to_return
  end


end

class Course

  attr_accessor :course_name, :department, :credits, :students

  def initialize(course_name, department, credits)
    @course_name, @department, @credits = course_name, department, credits
    @students = []
  end

  def add_student(student)
    @students << student
  end

end