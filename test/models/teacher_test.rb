require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test 'valid teacher' do
    teacher = Teacher.new(email: 'abc@def.com', first_name: 'name', last_name: 'name', specialism: 'specialism 1')
    assert teacher.valid?
  end

  test 'invalid without name' do
    teacher = Teacher.new
    refute teacher.valid?
    assert_not_nil teacher.errors[:email]
  end
end
