class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]


  def index 
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      puts("\n\n\n#{@user.save}\n\n\n")
      session[:user_id] = @user.id
      flash[:notice] = "welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    

  end

  def update 
    
    if @user.update(user_params)
      flash[:notice] = "your account is successfully updated"
       redirect_to articles_path
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
