class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :user, presence: true
  validates :title, presence: true,
                    length: { in: 4..100 }
  validates :description, length: { maximum: 2000 }
end
