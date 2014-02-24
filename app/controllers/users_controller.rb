class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:edit, :show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    @changed = @user.update(user_params)

    if @changed
      redirect_to user_path(@user.id)
    else
      render :edit
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
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
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
