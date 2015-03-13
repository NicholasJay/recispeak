class WelcomeController < ApplicationController
  before_action :logged_in?
  
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session["user_id"] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

end
