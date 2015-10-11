class UpdateExistingAnswersBest < ActiveRecord::Migration
  def change
    Answer.all.each do |answer|
      if answer.question.best_answer_chosen?
        if answer.question.best_answer_id == answer.id
          answer.is_best_answer = true
          answer.save!
          puts "Updated answer #{answer.id}."
        end
      end
    end
  end
end
