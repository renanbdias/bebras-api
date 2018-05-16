class RemoveCompetitorService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id
  needs :competitor_id

  include ServiceExceptionHandler

  steps :get_challenge,
        :get_competitor,
        :delete_competitor

  def call
    handle_exception do
      process_steps

      @challenge
    end
  end

  private
    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail "Challenge not found"
      end
    end

    def get_competitor
      unless @competitor = @challenge.competitors.find_by(id: competitor_id)
        fail "Competitor not found"
      end
    end

    def delete_competitor
      unless @competitor.destroy
        fail @competitor.errors
      end
    end
end
