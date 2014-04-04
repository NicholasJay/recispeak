require 'spec_helper'
describe Recipe do 
  it { should have_many(:steps) }
  it { should have_many(:ingredients) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:title) }
end
