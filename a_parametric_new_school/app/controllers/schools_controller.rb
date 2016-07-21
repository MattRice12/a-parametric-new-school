class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    render template: 'schools/index.html.erb', locals: {
      schools: School.all,
      teachers: Teacher.where(id: params[:id]),
    }
  end

  def show
    render template: 'schools/show.html.erb', locals: {
      school: School.find(params[:id]),
      teachers: Teacher.where(school_id: params[:id]),
      student: Student.where(teacher_id: params[:teacher_id])
    }
  end

  def new
    render locals: {
      school: School.new
    }
  end

  def create
    school = School.new
    school.name = params[:school][:name]
    if school.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'school/new.html.erb', locals: {
        school: school,
        teachers: Teacher.where(id: params[:id]),
        students: Student.where(teacher_id: params[:teacher_id])
      }
    end
  end

  def edit
    render locals: {
      school: School.find(params[:id])
    }
  end

  def update
    school = School.find(params[:id])
    user = User.find_by(id: session[:user_id])
    if user.school_id == school.id
      school.name = params[:school][:name]
      school.save
      redirect_to schools_path
    else
      flash[:alert] = "You cannot edit this school. You are not a member of it."
      render template: 'schools/edit.html.erb', locals: {
        school: school
      }
    end
  end

  def destroy
    school = School.find(params[:id])
    user = User.find_by(id: session[:user_id])
    if school.id != user.school_id
      flash[:alert] = "You cannot delete this school. You are not a member of it."
      redirect_to root_path
    else
      school.destroy
      flash[:alert] = "You deleted the school along with yourself. You must sign up again to perform further actions."
      redirect_to new_user_path
    end
  end
end
