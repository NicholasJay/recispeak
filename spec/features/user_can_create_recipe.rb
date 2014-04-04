require 'spec_helper'

describe "user can create a recipe" do 
  let(:user) { FactoryGirl.create(:user) }

  it "will signup a user" do

      # Workflow for feature
      visit root_path
      fill_in "email", with: user.email
      fill_in "password", with: "nick"
      click_button "Sign In" 
      click_button "Add Recipe"

  end
end
