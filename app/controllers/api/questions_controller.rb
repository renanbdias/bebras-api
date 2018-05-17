learclass Api::QuestionsController < ApplicationController
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

  # def answer
  #   exam = current_api_competitor.exam
  #   questions = exam.questions
  #   question = questions.find_by id: params[:id]
    
  #   selected_alternative = questions.alternatives.find_by id: alternative_id

  #   exam.exam_questions.answer = selected_alternative

  #   exam.exam_questions.save
  #   exam.save

  # end

  # private
  #   def update_params
  #     params.permit(:id, :arternative_id, :selected)
  #   end

  #   # POST /api/v1/questions/:id/answer
  #   # { alternative_id: 3 }

end

