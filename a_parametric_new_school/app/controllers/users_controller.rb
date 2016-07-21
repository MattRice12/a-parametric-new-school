class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update]

  def index
    render locals: {
      users: User.all,
      schools: School.all,
    }
  end

  def show
    render locals: {
      user: User.find(params[:id])
    }
  end

  def new
    render locals: {
      user: User.new,
    }
  end

  def create
    user = User.new
    user.school_id = params[:user][:school_id]
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    if user.save
      redirect_to user, notice: 'Successfully created an account and signed in!'
      session[:user_id] = user.id
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'users/new.html.erb', locals: {
        user: user
      }
    end
  end

  def edit
    user = User.find(params[:id])
    if user.id == session[:user_id]
      render locals: {
      user: User.find(params[:id])
    }
    else
      flash[:alert] = "You cannot edit another user."
      redirect_to users_path
    end
  end

  def update
    user = User.find(params[:id])
    user.school_id = params[:user][:school_id]
    user.name = params[:user][:name] if params[:user][:name].present?
    user.email = params[:user][:email] if params[:user][:email].present?
    user.password = params[:user][:password] if params[:user][:name].present?
    if user.save
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'users/edit.html.erb', locals: {
        user: user
      }
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user != user
      flash[:alert] = "You cannot delete other users, only you."
      redirect_to users_path
    else
      user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  end

  private
    def user_params
      params.require(:user).permit(:school_id, :name, :email, :password, :password_confirmation)
    end
end
