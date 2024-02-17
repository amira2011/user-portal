class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create] # this should only be used if you are allowing users to register themselves.

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have Successfully Signed Up"
      redirect_to(:users, notice: "User was successfully created")
    else
      render "new", status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
