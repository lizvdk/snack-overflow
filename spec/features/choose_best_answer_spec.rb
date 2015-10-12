require 'rails_helper'

feature 'select best answer', %{
  As a user
  I want to select the best answer to a question I asked
  So that I can mark it as the best
} do

  scenario 'Happy Path' do
    answer = FactoryGirl.create(:answer)
    sign_in answer.question.user
    visit question_path(answer.question)

    within("#answer-#{answer.id}") do
      click_on 'Award Best Answer'
    end

    expect(page).to have_content('Answer updated!')
    within("#answer-#{answer.id}") do
      expect(find('.label')).to have_content('Best Answer')
      expect(page).to_not have_content('Award Best Answer')
    end
  end

  scenario 'Sad Path' do
    answer = FactoryGirl.create(:answer)
    unauthorized_user = FactoryGirl.create(:user)
    sign_in unauthorized_user
    visit question_path(answer.question)

    expect(page).to_not have_content('Award Best Answer')
  end
end
