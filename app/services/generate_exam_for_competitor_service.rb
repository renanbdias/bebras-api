class GenerateExamForCompetitorService < BusinessProcess::Base
  needs :competitor

  include ServiceExceptionHandler

  steps :generate_competitor_exam

  def call
    handle_exception do
      process_steps

      @exam
    end
  end

  private

    def generate_competitor_exam
      case competitor.age
      when 0..7
        result = generate_exam_for_age_group 0
      when 8..9
        result = generate_exam_for_age_group 1
      when 10..11
        result = generate_exam_for_age_group 2
      when 12..13
        result = generate_exam_for_age_group 3
      when 14..15
        result = generate_exam_for_age_group 4
      when 15..16
        result = generate_exam_for_age_group 5
      when 16..18
        result = generate_exam_for_age_group 6
      end

      unless result
        fail "Failed to create exam #{@exam.errors.full_messages}"
      end
    end

    def generate_exam_for_age_group age_group
      @exam = competitor.build_exam
      @exam.questions = Question.order("RAND()").where(age_group: age_group).limit(15)
      @exam.valid? && @exam.save
    end
end