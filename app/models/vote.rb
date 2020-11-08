class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :voted_by, foreign_key: :voted_by_id, class_name: 'Teacher'
end
