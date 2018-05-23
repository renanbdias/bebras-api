class AddCompetitorToChallengeService < BusinessProcess::Base
  needs :deputy
  needs :challenge_id

  needs :name
  needs :email
  needs :age

  include ServiceExceptionHandler

  steps :get_challenge,
        :create_competitor,
        :associate_competitor_with_deputy_school,
        :add_competitor_to_exam

  def call
    handle_exception do
      process_steps

      @competitor
    end
  end

  private
    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail "Could not find challenge with id:#{challenge_id}"
      end
    end

    def create_competitor
      generated_password = Devise.friendly_token.first(8)
      unless @competitor = Competitor.new(name: name, email: email, age: age, password: generated_password, generated_password: generated_password)
        fail "Error creating competitor"
      end
    end

    def associate_competitor_with_deputy_school
      @competitor.school = deputy.school
    end

    def add_competitor_to_exam
      @challenge.competitors.append @competitor
      unless @challenge.valid? && @challenge.save
        @competitor.destroy
        fail "Error adding competitor Error: #{@challenge.errors.full_messages}"
      end
    end

    # TODO generate exam with questions (might be on another service)
end