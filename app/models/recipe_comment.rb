class RecipeComment < ActiveRecord::Base
  belongs_to :recipe

  validates :comments, presence: true
end
