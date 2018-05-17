class UpdateChallengeService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id
  needs :challenge_params

  include ServiceExceptionHandler

  steps :get_challenge,
        :check_if_started,
        :check_if_ended,
        :check_if_already_expired,
        :check_start_date,
        :update_challenge

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

    def check_if_started
      unless !@challenge.did_start
        fail "Challenge has already started"
      end
    end

    def check_if_ended
      unless !@challenge.did_finish
        fail "Challenge has already finished"
      end
    end

    def check_if_already_expired
      if DateTime.now > (@challenge.end_date + ExamDuration.first.exam_duration_in_minutes.minutes)
        fail "Challenge is expired"
      end
    end

    def check_start_date
      if challenge_params[:start_date]
        @parsed_date = DateTime.parse(challenge_params[:start_date])
        unless @parsed_date > DateTime.now
          fail "Date must be in the future"
        end
      end
    end

    def update_challenge
      @challenge.update_attributes challenge_params

      parsed_date = DateTime.parse(challenge_params[:start_date])
      @challenge.end_date = (parsed_date + ExamDuration.first.exam_duration_in_minutes.minutes)

      unless @challenge.valid? && @challenge.save
        fail(@challenge.errors)
      end
    end
end
