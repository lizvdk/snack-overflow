require "rails_helper"

feature "view recent questions", %{
  As a user
  I want to view recent questions
  So that I can see what other users have recently asked
} do

  let!(:questions) { FactoryGirl.create_list(:question, 20) }

  scenario "display questions, most recent- first" do

    visit questions_path

    expect(page).to have_selector('#recent-questions .well:nth-child(1)',
                    text: questions[19].title)
    expect(page).to have_selector('#recent-questions .well:nth-child(20)',
                    text: questions[0].title)
  end

  scenario "questions are links to show pages" do
    visit questions_path

    click_on questions[0].title

    expect(page).to have_content(questions[0].title)
    expect(page).to have_content(questions[0].description)
    within(".asker") do
      expect(page).to have_content(questions[0].user.username)
    end
  end
end
