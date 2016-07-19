class SchoolsController < ApplicationController
  def index
    render template: 'schools/index.html.erb', locals: {
      schools: School.all,
      teachers: Teacher.where(id: params[:id]),
      student: Student.where(teacher_id: params[:teacher_id])
    }
  end

  def show
    render template: 'schools/show.html.erb', locals: {
      school: School.find(params[:id]),
      teachers: Teacher.where(id: params[:id]),
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
