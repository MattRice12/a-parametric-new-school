class StudentsController < ApplicationController
  def index
    render template: 'students/index.html.erb', locals: {
      students: Student.all
    }
  end

  def show
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
