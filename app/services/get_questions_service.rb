class GetQuestionsService < BusinessProcess::Base
  needs :competitor

  include ServiceExceptionHandler

  steps :get_exam,
        :get_questions,
        :check_quantity

  def call
    handle_exception do
      process_steps

      @questions
    end
  end

  private
    def get_exam
      unless @exam = competitor.exam
        fail("Exame não foi encontrado")
      end
    end

    def get_questions
      unless @questions = @exam.questions
        fail("Questões não encontradas")
      end
    end

    def check_quantity
      unless @questions.count >= 15
        fail("Questões insuficientes")
      end
    end
end