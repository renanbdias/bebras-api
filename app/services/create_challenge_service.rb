class CreateChallengeService < BusinessProcess::Base
  needs :start_date
  needs :deputy
  needs :name

  include ServiceExceptionHandler

  steps :check_start_date,
        :create_challenge,
        :create_on_firebase,
        :update_model_with_firebase_token

  def call
    handle_exception do
      process_steps

      @challenge
    end
  end

  private
    def check_start_date
      @parsed_date = DateTime.parse(start_date)
      unless @parsed_date > DateTime.now
        fail "Date must be in the future"
      end
    end

    def create_challenge
      @challenge = deputy.challenges.create(start_date: @parsed_date, name: name, end_date: (@parsed_date + ExamDuration.first.exam_duration_in_minutes.minutes))
      unless @challenge.valid? && @challenge.save
        fail(@challenge.errors)
      end
    end

    def create_on_firebase
      base_uri = 'https://bebrasbr-6a3ba.firebaseio.com'  # change later to secrets

      firebase = Firebase::Client.new(base_uri)

      @response = firebase.push("challenges", { name: @challenge.name, did_start: @challenge.did_start, did_finish: @challenge.did_finish })
      unless @response.success?
        fail("Something went wrong on firebase")
      end
    end

    def update_model_with_firebase_token
      @challenge.firebase_token = @response.body["name"]
      unless @challenge.valid? && @challenge.save
        fail("Something went wrong on updating model")
      end
    end
end
