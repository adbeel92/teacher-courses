class Teacher < ApplicationRecord
  has_many :subscriptions
  has_many :courses, through: :subscriptions

  validates :email, :first_name, :last_name, :specialism, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
