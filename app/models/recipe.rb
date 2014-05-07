class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: lambda { |a| a[:entry].blank? }, allow_destroy: true
  accepts_nested_attributes_for :steps, reject_if: lambda { |a| a[:instructions].blank? }, allow_destroy: true
  
  validates :title, presence: true
end
