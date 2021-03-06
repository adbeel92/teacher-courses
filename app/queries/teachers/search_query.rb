module Teachers
  class SearchQuery
    EMAIL_VALIDATION_REGEX_PATTERN = /^(.+)@(.+)$/

    attr_reader :teachers, :message

    def initialize(args)
      @email = args[:email].to_s.downcase
      @course_id = args[:course_id]
      @teachers = Teacher.none
    end

    def call
      @teachers = Teacher.all if without_params?
      return unless valid_params?
      @teachers = scope.where("LOWER(email) = ?", email) if email.present?
      @teachers = scope.where(subscriptions: { course_id: course_id }) if course_id.present?
    end

    private

    attr_reader :email, :course_id

    def without_params?
      email.blank? && course_id.blank?
    end

    def valid_params?
      email_valid? && course_id_valid?
    end

    def email_valid?
      return true if email.blank? || email =~ EMAIL_VALIDATION_REGEX_PATTERN

      @message = 'Email not valid'
      false
    end

    def course_id_valid?
      return true if course_id.blank? || Course.exists?(course_id)

      @message = 'Course not valid'
      false
    end

    def scope
      @scope ||= Teacher.left_joins(:subscriptions)
    end
  end
end
