require "rails_helper"

feature "user sign up", %{
  As a visitor
  I want to register
  So that I can create an account
} do

  scenario "provide valid registration information" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path

    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    within(".dropdown") do
      click_on user.email
    end
    expect(page).to have_content("Sign out")
  end

  scenario "provide invalid registration information" do
    visit new_user_registration_path

    click_button "Sign up"
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign out")
  end
end
