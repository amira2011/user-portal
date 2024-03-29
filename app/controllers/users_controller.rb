class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create] # this should only be used if you are allowing users to register themselves.

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have Successfully Signed Up"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    render layout: "admin"
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params_edit)
      redirect_to root_path, notice: "Profile updated successfully."
    else
      render "edit", layout: "admin"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params_edit
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end
end
