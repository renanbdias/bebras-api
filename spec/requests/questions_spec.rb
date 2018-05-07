RSpec.describe "Question" do
  let(:competitor) { create :competitor, :competitor_with_exam_and_questions }

  context "Competitor requests questions" do
    before :each do
      response = GetQuestionsService.call(competitor: competitor)
      expect(response.success?).to be true
      @questions = response.result
      @exam = competitor.exam
    end

    # it "should have 15 questions" do
    #   expect(@questions.count).to be 15
    # end

    # it "has correct questions" do
    #   expect(@exam.questions).to be @questions
    # end
  end
end
