class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one :best_answer, -> { where(is_best_answer: true) }, class_name: 'Answer'

  enum status: %w(unanswered has_answers best_answer_chosen)

  include Votable

  validates :user, presence: true
  validates :title, presence: true,
                    length: { in: 4..100 }
  validates :description, length: { maximum: 2000 }

  scope :recent_first, -> { order(created_at: :desc) }

  extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:title, [:title, :id]]
  end

  def set_as_has_answers
    has_answers!
  end

  def set_to_best_answer_chosen
    best_answer_chosen!
  end

  def has_best_answer?
    best_answer.present?
  end
end
