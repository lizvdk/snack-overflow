class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

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

  def vote_points
    votes.upvote.size - votes.downvote.size
  end

  def has_vote_from?(user)
    votes.find_by(user_id: user.id).present?
  end

  def has_upvote_from?(user)
    votes.upvote.find_by(user_id: user.id).present?
  end

  def has_downvote_from?(user)
    votes.downvote.find_by(user_id: user.id).present?
  end
end
