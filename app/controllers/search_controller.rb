class SearchController < ApplicationController

  def index
  end

  def search
    @recipes = Recipe.all
    render json: @recipes
  end

  def new
  end

  def create
  end

  def show
  end
  
end
