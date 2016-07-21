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
    student.teacher_id = params[:student][:teacher_id]
    if student.save
      redirect_to student_path(student), notice: 'Student was successfully created.'
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'students/new.html.erb', locals: {
        student: student
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
      redirect_to student_path, notice: 'Student was successfully updated.'
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'students/edit.html.erb', locals: {
        student: student
      }
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to schools_path, notice: 'Student was successfully destroyed.'
  end
end
