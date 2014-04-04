require 'spec_helper'

describe "user can signup" do
  let(:user) { FactoryGirl.create(:user) }

  it "will signup a user" do

      # Workflow for feature
      visit root_path
      fill_in "email", with: user.email
      fill_in "password", with: "nick"
      click_button "Sign In"  
      # after signed in - should be redirected to the user's show page. 
      click_button "Edit Profile"
      fill_in "user_first_name", with: "Newname"
      click_button "Save"

      #expectations 
      expect(page).to have_content("Newname")
  end
end