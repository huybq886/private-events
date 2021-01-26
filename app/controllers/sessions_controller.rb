class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      if !user
        flash.now.alert = "User is unavailable!"
      else
        flash.now.alert = "Incorrect Password!"
      end
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end