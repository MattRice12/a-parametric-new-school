class TeachersController < ApplicationController
  def index
    render template: 'teachers/index.html.erb', locals: {
      teachers: Teacher.all,
      student: Student.where(id: params[:id])
    }
  end

  def show
    render template: 'teachers/show.html.erb', locals: {
      teacher: Teacher.find(params[:id]),
      student: Student.where(id: params[:id])
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
