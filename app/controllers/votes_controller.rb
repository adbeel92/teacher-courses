class VotesController < ApplicationController
  before_action :set_votable, only: :index

  def index
    @pagy, @votes = pagy(@votable.votes)
  end

  def create
    create_service = Votes::CreateService.new(vote_params)

    if create_service.call
      redirect_to request.referrer, notice: 'Vote was successfully created.'
    else
      @vote = create_service.vote
      render :new
    end
  end

  private

  def vote_params
    params.permit(:votable_id, :votable_type, :email)
  end

  def set_votable
    @votable = Object.const_get(params[:votable_type].to_s.capitalize).find_by(id: params[:votable_id])
  end
end
