class RecipesController < ApplicationController
  before_action :load_user, except: [:index]
  before_action :load_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @websiterecipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    5.times { @recipe.ingredients.build}
    5.times { @recipe.steps.build}
  end

  def create
    @recipe = @user.recipes.new(recipe_params)
    
    if @recipe.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @ingredients = Ingredient.where(recipe_id: @recipe)
    @steps = Step.where(recipe_id: @recipe)
    @allsteps = []
    @steps.each {|step| @allsteps << step.instructions}
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
      redirect_to user_recipe_path(@recipe.id)
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
    params.require(:recipe).permit(:category, :title, :notes, ingredients_attributes: [:id, :entry], steps_attributes: [:id, :instructions]) 
  end

end
