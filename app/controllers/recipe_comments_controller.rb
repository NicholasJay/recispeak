class RecipeCommentsController < ApplicationController

  def create
    @comment = RecipeComment.create(user_id: params[:user_id], recipe_id: params[:recipe_id], comments: params["comments"])
    @recipe = Recipe.find(params[:recipe_id])
    @user = User.find(params[:user_id])

    if @comment.save
      flash[:message] = "Comment Added!"
      redirect_to user_recipe_path(@user.id, @recipe.id)
    else
      flash[:message] = "Comment was not added!"
      redirect_to user_recipe_path(@user.id, @recipe.id)
    end
  end

  def destroy
    @comment = RecipeComment.find(params[:id])
    @comment.destroy
    @recipe = Recipe.find(params[:recipe_id])
    @user = User.find(params[:user_id])
    redirect_to user_recipe_path(@user, @recipe)
  end

end
