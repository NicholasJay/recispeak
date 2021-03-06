require 'nokogiri'
require 'open-uri'

class User < ActiveRecord::Base
  has_many :recipe_books
  has_many :recipe_comments
  has_many :recipes

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  self.has_secure_password()

  has_attached_file :profile_pic, :default_url => "chefatar.png",
                    :styles => {:thumb => "200x200#"},
                    :url => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  validates_attachment_content_type :profile_pic, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']
  validates_attachment_size :profile_pic, :less_than => 5.megabytes

  def is_admin?
    email == "nicholas@nick.com"
  end

  def get_ingredients_from_url(url)
    ingredients = Nokogiri::HTML(open(url)).css('li [itemprop="ingredients"]')
    return ingredients
  end

  def get_directions_from_url(url)
    directions = Nokogiri::HTML(open(url)).css('instructions', 'li span[class="plaincharacterwrap break"]', 'div [class="recipeDirections"] li', 'div [id="instructions"] li', 'li[class="instruction"]', 'div [class="instructions"] p', 'div[itemprop="instructions"] p', 'div[class="col12 directions"] p', 'div[itemprop="recipeInstructions"] p')
    return directions
  end
  
end
