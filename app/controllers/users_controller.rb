class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_session_path
    else 
      flash[:danger] = "Nope"
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:danger] = "Check Yo Self"
      redirect_to new_user_path
    end
  end

  def destroy
  end
end

private 
def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
end