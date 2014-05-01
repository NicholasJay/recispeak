class User < ActiveRecord::Base
  has_many :recipe_books
  has_many :recipe_comments
  has_many :recipes

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  self.has_secure_password()

end
