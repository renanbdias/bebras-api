class Api::ExamController < ApplicationController
  before_action :authenticate_api_competitor!

  def index
    begin
      competitor = current_api_competitor

      exam = competitor.exam

      if exam == nil
        raise "Exam is nil"
      end

      questions = exam.questions
      if questions == nil
        raise "Questions are nil"
      end

      render json: questions, status: :ok
    rescue Exception => e
      render json: {
        errors: [e.message]
      }, status: :unprocessable_entity
    end
  end

end