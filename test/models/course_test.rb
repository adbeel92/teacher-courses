require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'valid course' do
    course = Course.new(title: 'Test 1', category_id: 1)
    assert course.valid?
  end

  test 'invalid without name' do
    course = Course.new
    refute course.valid?
    assert_not_nil course.errors[:title]
  end
end
