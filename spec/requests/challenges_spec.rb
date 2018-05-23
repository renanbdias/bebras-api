RSpec.describe "Challenges" do

  # let(:deputy) { create :deputy, :deputy_with_challenges }
  # let(:competitor) { create :competitor }

  # # /api/v1/challenges/
  # context "Deputy challenges request" do
  #   before :each do
  #     response = GetChallengesService.call(deputy: deputy)
  #     expect(response.success?).to be true
  #     @challenges = response.result
  #   end

  #   # Factory creates 4 challenges
  #   it "should have at least 4 challenges" do
  #     expect(@challenges.count).to be 4
  #   end
  # end

  # # Check end date
  # context "Create challenge" do
  # end

  # subject(:deputy) { build(:deputy) }
  # context "Add competitor" do

  #   before :each do
  #     @challenge = deputy.challenges.first
  #     @competitors_count_before = @challenge.competitors.count
  #     @response = AddCompetitorToChallengeService.call(deputy: deputy,
  #                                                   challenge_id: @challenge.id,
  #                                                   name: Faker::Name.first_name,
  #                                                   email: Faker::Internet.email,
  #                                                   age: Faker::Number.digit)
  #     expect(response.success?).to be true
  #   end

  #   it "must have more competitors than before" do
  #     expect(@challenge.competitors.count).to be > @competitors_count_before
  #   end

  # end

  # context "Start challenge" do

  # end

end