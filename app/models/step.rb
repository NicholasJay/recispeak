class Step < ActiveRecord::Base
  belongs_to :recipe

  validates :step_number, presence: true
end
