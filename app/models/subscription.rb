class Subscription < ApplicationRecord
  belongs_to :teacher
  belongs_to :course

  validates :teacher_id, :course_id, presence: true
end
