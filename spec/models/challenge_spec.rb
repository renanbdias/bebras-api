require 'rails_helper'

# validates :start_date, :deputy, :name, presence: true

RSpec.describe Challenge, type: :model do
  describe 'validations' do

    context 'when challenge_date is nil' do
      subject(:challenge) { build(:challenge, start_date: nil) }
      it 'is invalid if start_date is nil' do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :start_date
      end
    end

    # context 'when deputy is nil' do
    #   subject(:challenge) { build(:challenge, deputy: nil) }
    #   it 'is invalid if deputy is nil' do
    #     expect(challenge).to be_invalid
    #     expect(challenge.errors).to include :deputy
    #   end
    # end

  end
end
