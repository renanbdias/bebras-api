class DeleteChallengeService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id

  include ServiceExceptionHandler

  steps :get_challenge,
        :delete_challenge

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

    def delete_challenge
      unless @challenge.destroy
        fail @challenge.errors
      end
    end
end
