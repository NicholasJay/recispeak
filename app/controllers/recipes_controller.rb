class RecipesController < ApplicationController
  before_action :load_user
  before_action :load_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @allrecipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = @user.recipes.create(category: params[:category], title: params[:title], notes: params[:notes], public_private: params[:public_private])


    if @recipe.save
      redirect_to user_recipe_path(@recipe.id)
    else
      @message = "Recipe not created! Try Again!"
      redirect_to user_path(@user)
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    @changed = @recipe.update(recipe_params)

    if @changed
      redirect_to user_recipe_path(@recipe.id)
    else 
      render 
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_path(@user)
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:category, :title, :notes, :public_private) 
  end

end
