module Votes
  class CreateService
    def initialize(args)
      @email = args[:email]
      @votable_id = args[:votable_id]
      @votable_type = args[:votable_type]
    end

    def call
      find_teacher
      return unless valid?

      vote.save
    end

    def vote
      @vote ||= Vote.new(votable: votable, voted_by: teacher)
    end

    private

    attr_reader :teacher, :email, :votable_id, :votable_type

    def valid?
      teacher.present? && votable.present?
    end

    def find_teacher
      search_query = Teachers::SearchQuery.new(email: email)
      search_query.call
      @teacher = search_query.teachers.first
    end

    def votable
      @votable ||= Object.const_get(votable_type.to_s.capitalize).find_by(id: votable_id)
    end
  end
end
