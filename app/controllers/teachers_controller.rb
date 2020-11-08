class TeachersController < ApplicationController
  before_action :set_course, only: :index
  
  def index
    search_query = Teachers::SearchQuery.new(search_params)
    search_query.call
    @pagy, @teachers = pagy(search_query.teachers)
  end

  def new
    @teacher = Teacher.new
  end

  def create
    create_service = Teachers::CreateService.new(teacher_params)

    if create_service.call
      redirect_to create_service.teacher, notice: 'Teacher was successfully created.'
    else
      render :new, teacher: create_service.teacher
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:email, :first_name, :last_name)
  end

  def search_params
    params.permit(:email, :course_id)
  end

  def set_course
    @course = Course.find_by(id: params[:course_id])
  end
end
