class RecipeBookEntriesController < ApplicationController
   before_action :load_user

   def create
   end

   def update
   end

   def destory
   end

private

  def load_user
    @user = User.find(params[:user_id])
  end

end
