class UsersController < ApplicationController
  def index 

  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      puts("\n\n\n#{@user.save}\n\n\n")
      flash[:notice] = "welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end


end
