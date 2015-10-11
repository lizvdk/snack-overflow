class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :categorizations
  has_many :categories, through: :categorizations

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
end
