require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe 'validations' do
    context 'when challenge_date is nil' do
      subject(:challenge) { build(:challenge, challenge_date: nil) }
      it 'is invalid if challenge_date is nil' do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :challenge_date
      end
    end
  end
end
