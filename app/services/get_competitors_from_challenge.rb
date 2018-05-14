class GetCompetitorsFromChallenge < BusinessProcess::Base
  needs :deputy
  needs :challenge_id

  include ServiceExceptionHandler

  steps :get_challenge,
        :get_competitors

  def call
    handle_exception do
      process_steps

      @competitors
    end
  end

  private
    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail "Challenge not found"
      end
    end

    def get_competitors
      unless @competitors = @challenge.competitors
        fail "Competitors are nil"
      end
    end

end