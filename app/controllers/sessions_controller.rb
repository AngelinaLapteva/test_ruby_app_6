class SessionsController < ApplicationController

  def new
  end

  def create
    # byebug
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # rails provide session object which you can use to keep the session
      # create  session instance, thst will help remain state of user being logged in for future requests until use will logs out
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end 