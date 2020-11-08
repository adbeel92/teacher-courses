require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'valid vote' do
    vote = Vote.new(votable_id: 1, votable_type: 'Course', voted_by_id: 1)
    assert vote.valid?
  end

  test 'invalid without name' do
    vote = Vote.new
    refute vote.valid?
    assert_not_nil vote.errors[:votable_id]
  end
end
