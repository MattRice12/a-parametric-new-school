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
    if teacher.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'teacher/new.html.erb', locals: {
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
      redirect_to teacher_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'teacher/edit.html.erb', locals: {
        teacher: teacher
      }
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy
    redirect_to root_path
  end
end
