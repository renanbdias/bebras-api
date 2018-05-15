RSpec.describe "Challenges" do

  let(:deputy) { create :deputy, :deputy_with_challenges }

  # /api/v1/challenges/
  context "Deputy challenges request" do
    before :each do
      response = GetChallengesService.call(deputy: deputy)
      expect(response.success?).to be true
      @challenges = response.result
    end

    # Factory creates 4 challenges
    it "should have at least 4 challenges" do
      expect(@challenges.count).to be 4
    end
  end

  # Check end date
  context "Create challenge" do
  end

  context "Add competitor" do

  end

  context "Start challenge" do

  end

end