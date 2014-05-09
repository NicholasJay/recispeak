require 'spec_helper'
describe Step do 
  it { should belong_to(:recipe) }
end
