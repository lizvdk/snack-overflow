class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  validates :user, presence: true
  validates :body, presence: true,
                    length: { in: 10..1000 }

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
