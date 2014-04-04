require 'spec_helper'

describe "user can signup" do
    let(:user) { FactoryGirl.build(:user) }

    it "will signup a user" do

        # Workflow for feature
        visit root_path
        click_link "Click Here to Get Started"
        fill_in "user_first_name", with: user.first_name
        fill_in "user_last_name", with: user.last_name 
        fill_in "user_email", with: user.email
        fill_in "user_password", with: "nick"
        fill_in "user_password_confirmation", with: "nick"
        click_button "Join"

        # Expectations
        expect(page).to have_content user.first_name
        expect(page).to have_link("Log Out")
    end

    it "will render back to the new page if user doesn't complete required fields" do 
        # Workflow for feature
        visit root_path
        click_link "Click Here to Get Started"
        fill_in "user_email", with: "hello@hello.com"
        click_button "Join"
        
        #Expectations
        expect(page).to have_content("Become a New Member")
    end
end