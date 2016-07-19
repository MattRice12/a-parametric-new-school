class StudentsController < ApplicationController
  def index
    render template: 'students/index.html.erb', locals: {
      students: Student.all
    }
  end

  def show
    student = Student.find(params[:id])
    render template: 'students/show.html.erb', locals: {
      student: student,
      teacher: student.teacher,
      school: student.teacher.school
    }
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
