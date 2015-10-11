class UpdateExistingQuestionStatus < ActiveRecord::Migration
  def change
    Question.all.each do |question|
      if question.answers.present?
        question.has_answers!
      end
    end
  end
end
