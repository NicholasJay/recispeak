class RecipesController < ApplicationController
  before_action :load_user, except: [:index]
  before_action :load_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @websiterecipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.ingredients.build}
    3.times { @recipe.steps.build}
  end

  def create
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      flash[:message] = "Recipe Created!"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @books = @user.recipe_books.all
    @ingredients = Ingredient.where(recipe_id: @recipe)
    @steps = Step.where(recipe_id: @recipe)
    @allsteps = []
    @steps.each do |step| 
      unless step.nil? 
        @allsteps << step.instructions
      end
    end
    @comments = RecipeComment.where(recipe_id: @recipe)
    render :show
  end

  def edit
    render :edit
  end

  def update
    @changed = @recipe.update(recipe_params)

    if @changed
      flash[:message] = "Recipe Updated!"
      redirect_to user_recipe_path(@recipe.user_id, @recipe.id)
    else 
      flash[:message] = "Recipe did not update!"
      redirect_to user_recipe_path(@recipe.user_id, @recipe.id)
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_path(@user)
  end

  private

  def load_user
    @user = User.find(current_user || params[:user_id])
  end

  def load_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:category, :title, :notes, ingredients_attributes: [:id, :entry, :_destroy], steps_attributes: [:id, :instructions, :_destroy]) 
  end

end
