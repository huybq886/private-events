class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash.notice = "User #{@user.name} successfully created!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end