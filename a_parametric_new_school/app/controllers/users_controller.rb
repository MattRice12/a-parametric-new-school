class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]

  def index
    render locals: {
      users: User.all
    }
  end

  def show
    render locals: {
      user: User.find(params[:id])
    }
  end

  def new
    render locals: {
      user: User.new
    }
  end

  def edit
    user = User.find(params[:id])
    if current_user != user
      flash[:alert] = "You cannot edit other users, only you."
      redirect_to users_path
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user, notice: 'User was successfully created.'
    else
      render :new, locals: {
        user: user
      }
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user, notice: "User was successfully updated"
    else
      render :edit, locals: {
        user: user
      }
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
