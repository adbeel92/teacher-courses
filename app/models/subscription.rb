class Subscription < ApplicationRecord
  belongs_to :teacher
  belongs_to :course

  has_many :votes, as: :votable

  validates :teacher_id, :course_id, presence: true
end
