class Api::QuestionsController < ApplicationController
  before_action :authenticate_api_competitor!, only: :index

  ## GET /api/v1/questions
  def index
    response = GetQuestionsService.call(competitor: current_api_competitor)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end
end

