class Course < ApplicationRecord
  belongs_to :category

  has_many :subscriptions
  has_many :teachers, through: :subscriptions
  has_many :votes, as: :votable

  validates :title, :tags, :category_id, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
