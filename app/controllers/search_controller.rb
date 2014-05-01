class SearchController < ApplicationController

  def index
  end

  def search
    @results = HTTParty.get("http://food2fork.com/api/search?key=a4ecbeef73d5e1fb138719ac9ed4c2e1&q=" + params[:keyword] + "")
    binding.pry
    render json: @results
  end

  def new
  end

  def create
  end

  def show
  end
  
end
