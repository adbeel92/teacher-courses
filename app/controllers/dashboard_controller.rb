class DashboardController < ApplicationController
  def index
    @courses_count = Course.count
    @teachers_count = Teacher.count
  end
end
