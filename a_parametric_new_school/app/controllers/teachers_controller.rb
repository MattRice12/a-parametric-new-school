class TeachersController < ApplicationController
  def index
    render template: 'teachers/index.html.erb', locals: {
      teachers: Teacher.all,
      student: Student.where(id: params[:id])
    }
  end

  def show
    teacher = Teacher.find(params[:id])
    student = Student.where(id: params[:id])
    render template: 'teachers/show.html.erb', locals: {
      teacher: teacher,
      student: Student.where(teacher_id: params[:teacher_id])
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
