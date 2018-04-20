class StartChallengeService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id

  include ServiceExceptionHandler

  steps :get_challenge,
        :check_if_challenges_has_already_started,
        :check_if_challenge_has_already_finished,
        :start_challenge_on_firebase,
        :update_challenge

  def call
    handle_exception do
      process_steps

      @challenge
    end
  end

  private
    # TODO check if challenge is in the right date!!

    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail("Did not find challenge")
      end
    end

    # Check if challenge has started
    def check_if_challenges_has_already_started
      if @challenge.did_start
        fail("Challenge has already been started")
      end
    end

    # Check if challenge has finished
    def check_if_challenge_has_already_finished
      if @challenge.did_finish
        fail("Challenge has already been finished")
      end
    end

    # Send a request to firebase to end the challenge
    def start_challenge_on_firebase
      base_uri = 'https://bebrasbr-6a3ba.firebaseio.com'  # change later to secrets

      firebase = Firebase::Client.new(base_uri)

      @response = firebase.update("challenges/#{@challenge.firebase_token}", { did_start: true })

      unless @response.success?
        fail("Something went wrong on firebase")
      end
    end

    def update_challenge
      @challenge.did_start = true
      @challenge.actual_start_date = DateTime.now
      unless @challenge.valid? && @challenge.save
        fail("Something went wrong updating")
      end
    end
end
