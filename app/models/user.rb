class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes, as: :votable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_vote_for(votable)
    Vote.find_by(user: self, votable: votable)
  end
end
