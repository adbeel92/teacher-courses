require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  test 'valid subscription' do
    subscription = Subscription.new(teacher_id: 1, course_id: 1)
    assert subscription.valid?
  end

  test 'invalid without name' do
    subscription = Subscription.new
    refute subscription.valid?
    assert_not_nil subscription.errors[:teacher_id]
  end
end
