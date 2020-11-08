require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  test 'valid admin user' do
    user = AdminUser.new(email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid without correct email' do
    user = AdminUser.new(email: 'johnexample.com')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    user = AdminUser.new
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end
