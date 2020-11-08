ActiveAdmin.register Subscription do
    permit_params :teacher_id, :course_id
  end
  