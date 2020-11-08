module TeachersHelper
  def teacher_full_name(teacher)
    return unless teacher.class == Teacher

    "#{teacher.first_name} #{teacher.last_name}"
  end
end
