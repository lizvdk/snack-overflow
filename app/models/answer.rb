class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  include Votable

  validates :user, presence: true
  validates :body, presence: true,
                    length: { in: 10..1000 }

end
