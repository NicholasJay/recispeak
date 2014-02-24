class User < ActiveRecord::Base
  has_many :recipe_books
  has_many :recipe_comments
  has_many :recipes
end
