class GetFirebaseTokenService < BusinessProcess::Base
  needs :competitor

  include ServiceExceptionHandler

  steps :get_challenge,
        :get_firebase_token

  def call
    handle_exception do
      process_steps

      @firebase_token
    end
  end

  private
    def get_challenge
      unless @challenge = competitor.challenge
        fail("Challenge not found")
      end
    end

    def get_firebase_token
      unless @firebase_token = @challenge.firebase_token
        fail("Firebase token not found")
      end
    end
end
