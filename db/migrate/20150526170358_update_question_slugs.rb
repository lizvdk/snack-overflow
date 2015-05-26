class UpdateQuestionSlugs < ActiveRecord::Migration
  def change
    Question.all.each do |question|
      question.save!
    end
  end
end
