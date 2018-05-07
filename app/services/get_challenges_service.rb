class GetChallengesService < BusinessProcess::Base
  needs :deputy

  include ServiceExceptionHandler

  steps :get_challenges

  def call
    handle_exception do
      process_steps

      @challenges
    end
  end

  private
    def get_challenges

      unless @challenges = deputy.challenges
        fail "Desafios não foram encontrados"
      end
    end
end