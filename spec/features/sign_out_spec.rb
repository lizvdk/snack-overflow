require "rails_helper"

feature "user signs out", %{
  As an authenticated user
  I want to sign out
} do

  let(:user) { FactoryGirl.create(:user) }

  scenario "authenticated user signs out" do
    sign_in user

    visit root_path

    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end

  scenario "unauthenticated user attempts to sign out" do
    visit "/"
    expect(page).to_not have_content("Sign out")
  end
end
