class Category < ActiveRecord::Base
  belongs_to :categorizations

  has_many :categorizations
  has_many :questions, through: :categorizations

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name, [:name, :id]]
  end
end
