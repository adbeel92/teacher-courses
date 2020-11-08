class SubscriptionsController < ApplicationController
  before_action :set_course
  before_action :set_categories

  def index
    @pagy, @subscriptions = pagy(@course.nil? ? Subscription.all : @course.subscriptions)
  end

  def new
    @subscription = @course.subscriptions.new
  end

  def create
    create_service = Subscriptions::CreateService.new(subscription_params)

    if create_service.call
      redirect_to course_subscriptions_path(course_id: create_service.subscription.course_id), notice: 'Subscription was successfully created.'
    else
      @subscription = create_service.subscription
      render :new
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:course_id, :teacher_id, :teacher_email, :teacher_first_name, :teacher_last_name, :teacher_specialism)
  end

  def set_course
    @course = Course.find_by(id: params[:course_id])
  end

  def set_categories
    @categories = Category.all
  end
end
