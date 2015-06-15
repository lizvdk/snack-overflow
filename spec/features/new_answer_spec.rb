require "rails_helper"

feature "answer a question", %{
  As a user
  I want to answer a question
  So that I can help the asker
} do

  let(:answer) { FactoryGirl.build(:answer) }

  scenario "authenticated user submits valid form" do
    sign_in answer.user

    visit question_path(answer.question)

    fill_in "Answer", with: answer.body

    click_button "Submit answer"

    expect(page).to have_content("Answer posted sucessfully.")
    within("#answers") do
      expect(page).to have_content(answer.body)
      expect(page).to have_content(answer.user.email)
    end
  end

  scenario "invalid form" do
    sign_in answer.user

    visit question_path(answer.question)

    click_button "Submit answer"

    expect(page).to have_content("can't be blank")
  end

  scenario "unauthenticated visitor" do
    visit question_path(answer.question)
    expect(page).not_to have_content("Submit answer")
    expect(page).to have_content("Please sign in to answer this question.")

  end
end
