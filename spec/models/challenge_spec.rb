require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe 'validations' do

    context 'when start_date is nil' do
      subject(:challenge) { build(:challenge, start_date: nil) }
      it 'is invalid if start_date is nil' do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :start_date
      end
    end

    context "when end_date is nil" do
      subject(:challenge) { build(:challenge, end_date: nil) }
      it "is invalid if end_date is nil" do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :end_date
      end
    end

    context "when deputy is nil" do
      subject(:challenge) { build(:challenge, deputy: nil) }
      it "is invalid if deputy is nil" do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :deputy
      end
    end

    context "when name is nil" do
      subject(:challenge) { build(:challenge, name: nil) }
      it "is invalid if name is nil" do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :name
      end
    end

    context "when challenge did_satrt is false and did_end is true" do
      subject(:challenge) { build(:challenge, name: nil) }
      it "is invalid if name is nil" do
        expect(challenge).to be_invalid
        expect(challenge.errors).to include :name
      end
    end

  end
end
