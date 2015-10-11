class AddIsBestAnswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :is_best_answer, :boolean, default: false
  end
end
