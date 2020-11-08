module Teachers
  class CreateService
    attr_reader :teacher

    def initialize(args)
      @email = args[:email]
      @first_name = args[:first_name]
      @last_name = args[:last_name]
      @specialism = args[:specialism]
    end

    def call
      @teacher = Teacher.new(email: email, first_name: first_name, last_name: last_name, specialism: specialism)
      teacher.avatar = Faker::Avatar.image
      return unless valid?

      teacher.save
    end

    private

    attr_reader :email, :first_name, :last_name, :specialism

    def valid?
      teacher.valid?
    end
  end
end
