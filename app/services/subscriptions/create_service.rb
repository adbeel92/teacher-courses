module Subscriptions
  class CreateService
    attr_reader :subscription

    def initialize(args)
      @teacher_id = args[:teacher_id]
      @course_id = args[:course_id]
      @teacher_email = args[:teacher_email]
      @teacher_first_name = args[:teacher_first_name]
      @teacher_last_name = args[:teacher_last_name]
      @teacher_specialism = args[:teacher_specialism]
    end

    def call
      @subscription = Subscription.new(teacher_id: teacher_id, course_id: course_id)
      return unless valid?

      subscription.save
    end

    private

    attr_reader :teacher_id, :course_id, :teacher_email, :teacher_first_name, :teacher_last_name, :teacher_specialism

    def valid?
      teacher_valid? && course_valid? && !subscription_exists?
    end

    def teacher_valid?
      return true if Teacher.exists?(teacher_id)
      teacher = build_teacher
      @teacher_id = teacher.id
      return true if build_teacher.persisted?

      subscription.errors.add(:teacher_id, 'not found')
      false
    end

    def build_teacher
      teacher_create_service = Teachers::CreateService.new(
        email: teacher_email,
        first_name: teacher_first_name,
        last_name: teacher_last_name,
        specialism: teacher_specialism,
      )
      teacher_create_service.call
      teacher_create_service.teacher
    end

    def course_valid?
      return true if Course.exists?(course_id)

      subscription.errors.add(:course_id, 'not found')
      false
    end

    def subscription_exists?
      return false unless Subscription.exists?(teacher_id: teacher_id, course_id: course_id)

      subscription.errors.add(:base, 'already exists')
      true
    end
  end
end
