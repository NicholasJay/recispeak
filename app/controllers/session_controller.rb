class SessionController < ApplicationController

  def new
    render(:new)
  end

  def create
    user = User.find_by(email: params[:email])
    if user && (user.authenticate(params[:password]) ) 
      session[:user_id] = user.id 
      redirect_to user_path(user) 
    else
      flash[:message] = "Email or Password is incorrect!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end