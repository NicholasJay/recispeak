require 'spec_helper'
describe Step do 
  it { should belong_to(:recipe) }

  it { should validate_presence_of(:step_number) }
end
