require 'spec_helper'

describe "user can signup" do
    let(:user) { FactoryGirl.create(:user) }

    it "will signup a user" do

        # Workflow for feature
        visit root_path
        fill_in "email", with: user.email
        fill_in "password", with: "nick"
        click_button "Sign In"

        # Expectations
        expect(page).to have_content user.first_name
        expect(page).to have_link("Log Out")
    end
end