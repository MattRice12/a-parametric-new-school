class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render template: 'students/index.html.erb', locals: {
      students: Student.all.order(:name)
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
    render locals: {
      student: Student.new
    }
  end

  def create
    student = Student.new
    student.name = params[:student][:name]
    if student.save
      redirect_to student_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'student/new.html.erb', locals: {
        sudent: student
      }
    end
  end

  def edit
    render locals: {
      student: Student.find(params[:id])
    }
  end

  def update
    student = Student.find(params[:id])
    student.name = params[:student][:name] if params[:student][:name].present?
    if student.save
      redirect_to student_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'student/edit.html.erb', locals: {
        student: student
      }
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to student_path
  end
end
