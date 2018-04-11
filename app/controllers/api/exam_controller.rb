class Api::ExamController < ApplicationController
  before_action :authenticate_api_competitor!, only: :index

  def index
    response = GetQuestionsService.call(competitor: current_api_competitor)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  def new
  end

  def create
  end

end
