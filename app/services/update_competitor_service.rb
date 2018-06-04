class UpdateCompetitorService < BusinessProcess::Base
  needs :deputy

  needs :challenge_id
  needs :competitor_id

  needs :name
  needs :email
  needs :age

  steps :get_challenge,
        :get_competitor,
        :update_competitor

  include ServiceExceptionHandler

  def call
    handle_exception do
      process_steps

      @competitor
    end
  end

  private
    def get_challenge
      unless @challenge = deputy.challenges.find_by(id: challenge_id)
        fail("Challenge not found")
      end
    end

    def get_competitor
      unless @competitor = @challenge.competitors.find_by(id: competitor_id)
        fail("Competitor not found")
      end
    end

    def update_competitor
      if name != nil
        @competitor.name = name
      end

      if email != nil
        @competitor.email = email
      end

      if age != nil
        @competitor.age = age
      end

      unless @competitor.valid? && @competitor.save
        fail("Failed to update competitor, errors: #{@competitor.errors}")
      end
    end

end