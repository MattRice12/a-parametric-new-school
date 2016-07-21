class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render template: 'teachers/index.html.erb', locals: {
      teachers: Teacher.all,
      student: Student.where(id: params[:id]),
      school: School.where(id: params[:id])
    }
  end

  def show
    teacher = Teacher.find(params[:id])
    student = Student.where(id: params[:id])
    render template: 'teachers/show.html.erb', locals: {
      teacher: teacher,
      student: student
    }
  end

  def new
    render locals: {
      teacher: Teacher.new
    }
  end

  def create
    teacher = Teacher.new
    teacher.name = params[:teacher][:name]
    teacher.school_id = params[:teacher][:school_id]
    if teacher.save
      redirect_to teacher_path(teacher), notice: 'Student was successfully created.'
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'teachers/new.html.erb', locals: {
        teacher: teacher
      }
    end
  end

  def edit
    render locals: {
      teacher: Teacher.find(params[:id])
    }
  end

  def update
    teacher = Teacher.find(params[:id])
    teacher.name = params[:teacher][:name] if params[:teacher][:name].present?
    if teacher.save
      redirect_to teacher_path, notice: 'Teacher was successfully updated.'
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'teachers/edit.html.erb', locals: {
        teacher: teacher
      }
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy
    redirect_to root_path, notice: 'Teacher was successfully destroyed.'
  end
end
