require 'spec_helper'
describe Ingredient do 
  it { should belong_to(:recipe) }

  it { should validate_presence_of(:entry) }
end
