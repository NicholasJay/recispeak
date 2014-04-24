class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:show]

  def index
  end

  def new
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

  def show
    @websiterecipes = Recipe.all
    @allrecipes = Recipe.where(user_id: @user)
  end

  def update
    @changed = @user.update(user_params)

    if @changed
      flash[:message] = "Updated Successfully"
      redirect_to user_path(@user.id)
    else
      flash[:message] = 'Update Failed!'
      redirect_to user_path(@user.id)
    end
  end

    def destroy
      @user.destroy
      session.destroy
      redirect_to root_path
    end

    private

    def load_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :facebook_url, :twitter_name, :address, :city, :state, :zipcode, :password, :password_confirmation, :birthday)
    end

    def authenticate
      unless logged_in?
        redirect_to root_path
      end
    end

    def authorize
      unless current_user == @user
        redirect_to root_path
      end
    end

end
