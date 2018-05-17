require 'rails_helper'

RSpec.describe Competitor, type: :model do
  describe 'validations' do

    context 'when name is nil' do
      subject(:competitor) { build(:competitor, name: nil) }
      it 'is invalid if name is nil' do
        expect(competitor).to be_invalid
        expect(competitor.errors).to include :name
      end
    end

    context "when email is nil" do
      subject(:competitor) { build(:competitor, email: nil) }
      it "is invalid if email is nil" do
        expect(competitor).to be_invalid
        expect(competitor.errors).to include :email
      end
    end

    context "when password is nil" do
      subject(:competitor) { build(:competitor, password: nil) }
      it "is invalid if password is nil" do
        expect(competitor).to be_invalid
        expect(competitor.errors).to include :password
      end
    end

    context "when age is nil" do
      subject(:competitor) { build(:competitor, age: nil) }
      it "is invalid if age is nil" do
        expect(competitor).to be_invalid
        expect(competitor.errors).to include :age
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
