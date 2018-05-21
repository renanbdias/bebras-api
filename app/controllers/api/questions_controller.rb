class Api::QuestionsController < ApplicationController
  before_action :authenticate_api_competitor!, only: [:index, :answer]

  ## GET /api/v1/questions
  def index
    response = GetQuestionsService.call(competitor: current_api_competitor)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## POST /api/v1/questions/:id/answer
  def answer
    response = AnswerQuestionService.call(competitor: current_api_competitor, question_id: params[:id], alternative_id: answer_params[:alternative_id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  private
    def answer_params
      params.permit(:alternative_id)
    end

end

