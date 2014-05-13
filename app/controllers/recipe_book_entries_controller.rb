class RecipeBookEntriesController < ApplicationController
   before_action :load_user


   def create
    @book_entry = RecipeBookEntry.create(recipe_id: params[:recipe_id], recipe_book_id: params[:recipe_book_id])
    @recipe = Recipe.find(params[:recipe_id])

    if @book_entry.save
      flash[:message] = "Saved To Book!"
      redirect_to user_recipe_path(@user.id, @recipe.id)
    else
      flash[:message] = "Error! Did not save to book!"
      redirect_to user_recipe_path(@user.id, @recipe.id)
    end
   end

   def update
   end

   def destroy
    @entry = RecipeBookEntry.find(params[:id])
    @entry.destroy
    redirect_to user_recipe_books_path(@user.id)
   end

private

  def load_user
    @user = User.find(params[:user_id])
  end


end
