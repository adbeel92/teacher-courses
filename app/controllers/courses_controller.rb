class CoursesController < ApplicationController
  before_action :set_category
  before_action :set_categories
  before_action :set_course, only: :show

  def index
    @pagy, @courses = pagy(@category.nil? ? Course.all : @category.courses)
  end

  def show
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  def set_categories
    @categories = Category.all
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
