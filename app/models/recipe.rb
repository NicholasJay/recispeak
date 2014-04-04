class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps

  validates :category, presence: true
  validates :title, presence: true
end
