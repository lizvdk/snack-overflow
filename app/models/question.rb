class Question < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true,
                    length: { in: 4..100 }
end
