class UsersController < ApplicationController  
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Travel Note!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  private
    def user_params
     params.require(:user).permit(:name, :email,
              :password, :password_confirmation)
    end
end
