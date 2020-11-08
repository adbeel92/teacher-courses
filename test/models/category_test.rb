require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'valid category' do
    category = Category.new(name: 'Test 1')
    assert category.valid?
  end

  test 'invalid without name' do
    category = Category.new
    refute category.valid?
    assert_not_nil category.errors[:name]
  end
end
