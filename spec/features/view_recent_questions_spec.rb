require "rails_helper"

feature "view recent questions", %{
  As a user
  I want to view recent questions
  So that I can see what other users have recently asked
} do

  questions = FactoryGirl.create_list(:question, 20)

  scenario "display questions, most recent- first" do

    visit root_path

    click_on "Answer"

    expect(page).to have_selector("ul#recent-questions li:nth-child(1)",
                    text: questions[19].title)
    expect(page).to have_selector("ul#recent-questions li:nth-child(20)",
                    text: questions[0].title)
  end

  scenario "questions are links to show pages" do
    visit questions_path

    click_on questions[0].title

    expect(page).to have_content(questions[0].title)
    expect(page).to have_content(questions[0].description)
    expect(page).to have_content(questions[0].created_at)
    within(".asker") do
      expect(page).to have_content(questions[0].user.email)
    end
  end
end
