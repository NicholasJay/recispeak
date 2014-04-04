class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :entry, presence: true
end