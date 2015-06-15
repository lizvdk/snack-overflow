require "rails_helper"

feature "ask a question", %{
  As a user
  I want to ask a question
  So that I can get answers from the community
} do

  let(:user) { FactoryGirl.create(:user) }

  scenario "authenticated user submits valid form" do
    question = FactoryGirl.build(:question)
    sign_in user

    visit root_path

    click_on "Ask"

    fill_in "Title", with: question.title
    fill_in "Additional details", with: question.description

    click_button "Ask question"

    expect(page).to have_content("Question posted sucessfully.")
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
    within(".asker") do
      expect(page).to have_content(user.email)
    end
  end

  scenario "invalid form" do
    sign_in user

    visit root_path

    click_on "Ask"

    click_button "Ask question"

    expect(page).to have_content("can't be blank")
  end

  scenario "unauthenticated visitor is redirected to sign in" do
    visit root_path

    click_on "Ask"

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
