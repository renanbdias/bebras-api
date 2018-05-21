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

  ## POST /api/v1/questions/:id/answer_questions
  def answer_questions
    answers = params[:answers]

    answers.each do |answer|
      ## If some error occurs I'll just ignore it since I try to save the other answers.
      response = AnswerQuestionService.call(competitor: current_api_competitor, question_id: answer[:question_id], alternative_id: answer[:alternative_id])
      unless response.success?
        ExamLog.create error: "#{response.error}. Questão: #{answer[:question_id]}, Alternativa: #{answer[:alternative_id]}, Aluno: #{current_api_competitor.id}"
      end
    end

    render json: {}, status: :ok  # "render nothing: true, status: :ok" not working oO ???
  end

  private
    def answer_params
      params.permit(:alternative_id)
    end
end

