class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session["user_id"] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def input
    @user = User.find(params[:user_id])
    @ingredients = get_ingredients_from_url(params[:address_input])

    @amounts = get_amounts_from_url(params[:address_input])

    @get_directions = []
    @get_directions << get_directions_from_url(params[:address_input])
    @directions = @get_directions.join("").split(".")

    if @ingredients.empty?
      @message_ingredient = "Ingredients Not Found"
    end
    if @directions.empty?
      @message_direction = "Directions Not Found"
    end

  end

  def input_recipe 
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.create(title: params[:title] )
    @recipe.save
    render json: @recipe
  end

  def input_ingredients
    @ingredient = Ingredient.create(entry: params[:entry], recipe_id: params[:recipe_id])
    @ingredient.save
    render json: @ingredient
  end

  def input_directions
    @direction = Step.create(instructions: params[:instructions], recipe_id: params[:recipe_id])
    @direction.save
    render json: @direction
  end

  def show
    @recipe_book_entry = RecipeBookEntry.new
    @websiterecipes = Recipe.all
    @allbooks = RecipeBook.where(user_id: @user)
    @allrecipes = Recipe.where(user_id: @user)
  end

  def update
    @changed = @user.update(user_params)

    if @changed
      flash[:message] = "Updated Successfully"
      redirect_to user_path(@user.id)
    else
      flash[:message] = 'Update Failed!'
      redirect_to user_path(@user.id)
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
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :facebook_url, :twitter_name, :address, :city, :state, :zipcode, :password, :password_confirmation, :birthday)
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

  def get_ingredients_from_url(url)
    ingredients = Nokogiri::HTML(open(url)).css('li [itemprop="ingredients"] > text()', 'span [itemprop="name"] > text()', 'span [class="ingredient-name"] > text()', 'span [itemprop="ingredients"] > text()', 'div [class="clrLeft"] > text()')
    if url.include?("thepioneerwoman" || "epicurious")
      ingredients.shift
      return ingredients
    else
      return ingredients
    end
  end

  def get_amounts_from_url(url)
    amounts = Nokogiri::HTML(open(url)).css('span [class="ingredient-amount"] > text()', 'span [itemprop="amount"] > text()')
    return amounts
  end

  def get_directions_from_url(url)
    directions = Nokogiri::HTML(open(url)).css('instructions > text()', 'li span[class="plaincharacterwrap break"] > text()', 'div [class="recipeDirections"] li > text()', 'div [id="instructions"] li > text()', 'li[class="instruction"] > text()', 'div [class="instructions"] p > text()', 'div[itemprop="instructions"] p > text()', 'div[class="col12 directions"] p > text()', 'div[itemprop="recipeInstructions"] p > text()', 'ol[itemprop="instructions"] li > text()')
    return directions
  end

end
