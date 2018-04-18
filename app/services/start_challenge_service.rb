class StartChallengeService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id

  include ServiceExceptionHandler

  steps :get_challenge,
        :update_challenge

  def call
    handle_exception do
      process_steps

      @challenge
    end
  end

  private
  # check if challenge is in the right date!!

    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail("Did not find challenge")
      end
    end

    def update_challenge
      @challenge.did_start = true

      unless @challenge.valid? && @challenge.save
        fail("Something went wrong updating")
      end
    end
end
