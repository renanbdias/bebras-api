class UpdateCompetitorService < BusinessProcess::Base
  needs :deputy

  needs :challenge_id
  needs :competitor_id

  needs :name
  needs :email
  needs :age

  steps :get_challenge,
        :get_competitor,
        :update_competitor,
        :generate_competitor_exam

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
      @should_generate_test = false
      if name != nil
        @competitor.name = name
      end

      if email != nil
        @competitor.email = email
      end

      if age != nil
        if @competitor.age != age
          @should_generate_test = true
        end
        @competitor.age = age
      end

      unless @competitor.valid? && @competitor.save
        fail("Failed to update competitor, errors: #{@competitor.errors}")
      end
    end

    def generate_competitor_exam
      if @should_generate_test
        response = GenerateExamForCompetitorService.call(competitor: @competitor)
        unless response.success?
          fail "Error generating exam #{response.error}"
        end
      end
    end

end