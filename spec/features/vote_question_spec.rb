require "rails_helper"

feature "vote on a question", %{
  As a user
  I want vote on a question
  So that I can express my opinion of the quality of the question
} do

  question = FactoryGirl.create(:question)
  user = FactoryGirl.create(:user)

  scenario "authenticated user upvotes question", js: true, driver: :webkit do
    sign_in user
    visit question_path(question)

    within("#question-#{question.id}") do
      find(:css, '.upvote').trigger('click')
    end
    within("#question-#{question.id} .vote-total") do
      expect(page).to have_content("1")
    end
  end

  pending "authenticated user downvotes question" , js: true, driver: :webkit do
    sign_in user
    visit question_path(question)

    within("#question-#{question.id}") do
      find(:css, '.downvote').trigger('click')
    end
    within("#question-#{question.id} .vote-total") do
      expect(page).to have_content("-1")
    end
  end

  pending "authenticated user removes upvote by clicking upvote again"
  pending "authenticated user removes downvote by clicking downvote again"
  pending "authenticated user removes downvote by clicking downvote again"
  pending "authenticated user switches upvote to downvote"
  pending "authenticated user switches downvote to upvote"
  pending "unauthenticated visitor may not vote"
end
