class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  after_create :update_question_status if :is_first_answer?
  after_update do
    question.update_attribute(:status, 'best_answer_chosen') if self.is_best_answer?
  end

  include Votable

  validates :user, presence: true
  validates :body, presence: true,
                    length: { in: 10..1000 }

  def is_first_answer?
    question.answers.size = 1
  end

  def update_question_status
    question.set_as_has_answers
  end
end
