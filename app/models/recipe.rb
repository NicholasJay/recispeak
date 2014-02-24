class Recipe < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipe_books
  has_many :recipe_comments
end
