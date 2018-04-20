class EndChallengeService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id

  include ServiceExceptionHandler

  steps :get_challenge,
        :check_if_didnt_start,
        :check_if_did_finish,
        :end_challenge_on_firebase,
        :update_model

  def call
    handle_exception do
      process_steps

      @challenge
    end
  end

  private
    # TODO check if challenge is in the right date!!

    # Get the challenge from deputy with 'challenge_id'
    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail("Did not find challenge")
      end
    end

    # Checks if the challenge in question didn't start
    def check_if_didnt_start
      if !@challenge.did_start
        fail("Challenge didn't start yet")
      end
    end

    # Checks if the challenge in question has already finished
    def check_if_did_finish
      if @challenge.did_finish
        fail("Challenge already did finish")
      end
    end

    # Send a request to firebase to end the challenge
    def end_challenge_on_firebase
      base_uri = 'https://bebrasbr-6a3ba.firebaseio.com'  # change later to secrets

      firebase = Firebase::Client.new(base_uri)

      @response = firebase.update("challenges/#{@challenge.firebase_token}", { did_finish: true })

      unless @response.success?
        fail("Something went wrong on firebase")
      end
    end

    # Update the model
    def update_model
      @challenge.did_finish = true
      @challenge.actual_end_date = DateTime.now
      unless @challenge.valid? && @challenge.save
        fail("Something went wrong on updating model")
      end
    end

end