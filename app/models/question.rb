class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

  validates :user, presence: true
  validates :title, presence: true,
                    length: { in: 4..100 }
  validates :description, length: { maximum: 2000 }

  scope :recent_first, -> { order(created_at: :desc) }

  def vote_points
    votes.upvote.size - votes.downvote.size
  end
end
