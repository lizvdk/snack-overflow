class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :user, presence: true
  validates :body, presence: true,
                    length: { in: 10..1000 }
end
