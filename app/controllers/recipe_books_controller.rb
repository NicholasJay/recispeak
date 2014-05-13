class RecipeBooksController < ApplicationController
  before_action :load_user

  def index
    @books = @user.recipe_books.all
    @recipebook = RecipeBook.new 
  end

  def new
  end

  def create
    @recipebook = @user.recipe_books.new(recipe_book_params)
    
    if @recipebook.save
      flash[:message] = "Recipe Book Created!"
      redirect_to user_recipe_books_path(@user.id)
    else
      render :new
    end
  end

  def show
    @recipe_book = RecipeBook.find(params[:id])
    @books = @user.recipe_books.all
    @recipes = RecipeBookEntry.where(recipe_book_id: params[:id])
  end

  def edit
    render :edit
  end

  def update
    @changed = @recipebook.update(recipe_book_params)

    if @changed
      redirect_to user_recipe_book_path(@recipebook.id)
    else 
      redirect_to user_recipe_book_path(@recipebook.id)
    end
  end

  def destroy
    @recipebook.destroy
    redirect_to user_path(@user)
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def recipe_book_params
    params.require(:recipe_book).permit(:title) 
  end

end