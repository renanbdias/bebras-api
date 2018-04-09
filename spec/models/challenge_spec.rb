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

    context 'when deputy_id is nil' do
      subject(:challenge) { build(:challenge, deputy_id: nil) }
      it 'is invalid if deputy_id is nil' do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :deputy_id
      end
    end

  end
end
