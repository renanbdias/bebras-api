class AnswerQuestion < BusinessProcess::Base
  needs :competitor
  needs :question_id
  needs :alternative_id

  include ServiceExceptionHandler

  steps :get_exam,
        :get_questions,
        :get_question,
        :get_selected_alternative

  def call
    handle_exception do
      process_steps

      @exam_question
    end
  end

  private
    def get_exam
      unless @exam = current_api_competitor.exam
        fail "Desafio não encontrado"
      end
    end

    def get_questions
      unless @questions = @exam.questions
        fail "Questões não encontradas"
      end
    end
    
    def get_question
      unless @question = @questions.find_by(id: question_id)
        fail "Questão não encontrada"
      end
    end

    def get_selected_alternative
      unless @selected_alternative = @questions.alternatives.find_by(id: alternative_id)
        fail "Alternativa selecionada não encontrada"
      end
    end

    def get_exam_question
      unless @exam_questions = ExamsQuestion.all.where(exam_id: exam.id, question_id: question_id)
        fail "Questões não encontradas"
      end
    end

    def save_alternative_on_exam
      @exam_question = @exam_questions.first
      @exam_question.alternative = @selected_alternative
      unless @exam_question.valid? && @exam_question.save
        fail "Alternativa selecionada não foi salva"
      end
    end
end