class GetChallengesService < BusinessProcess::Base
  needs :deputy

  include ServiceExceptionHandler

  steps :get_challenges,
        :check_expiration

  def call
    handle_exception do
      process_steps

      @challenges
    end
  end

  private

    # Get all challenges from deputy
    def get_challenges
      unless @challenges = deputy.challenges
        fail "Desafios não foram encontrados"
      end
    end

    # Checks the challenge expiration date (ends challenge if deputy didn't)
    # Move later to a scope
    def check_expiration
      @challenges.each do |challenge|
        if DateTime.now > (challenge.end_date + ExamDuration.first.exam_duration_in_minutes.minutes)
          challenge.did_finish = true
          end_challenge_on_firebase challenge.firebase_token
        end
      end
    end

    # Send a request to firebase to end the challenge
    def end_challenge_on_firebase firebase_token
      base_uri = 'https://bebrasbr-6a3ba.firebaseio.com'  # change later to secrets

      firebase = Firebase::Client.new(base_uri)

      @response = firebase.update("challenges/#{@challenge.firebase_token}", { did_finish: true })

      unless @response.success?
        fail("Something went wrong on firebase")
      end
    end
end