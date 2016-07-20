class SchoolsController < ApplicationController
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
    school.name = params[:school][:name] if params[:school][:name].present?
    if school.save
      redirect_to school_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'school/edit.html.erb', locals: {
        school: school
      }
    end
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    redirect_to root_path
  end
end
