require 'rails_helper'

RSpec.describe Deputy, type: :model do
  describe 'validations' do
    context 'when name is nil' do
      subject(:deputy) { build(:deputy, name: nil) }
      it 'is invalid if name is nil' do
        expect(deputy).to be_invalid
        expect(deputy.errors).to include :name
      end
    end

    context 'when email is nil' do
      subject(:deputy) { build(:deputy, email: nil) }
      it 'is invalid if email is nil' do
        expect(deputy).to be_invalid
        expect(deputy.errors).to include :email
      end
    end

    context 'when phone is nil' do
      subject(:deputy) { build(:deputy, phone: nil) }
      it 'is invalid if phone is nil' do
        expect(deputy).to be_invalid
        expect(deputy.errors).to include :phone
      end
    end

    context 'when password is nil' do
      subject(:deputy) { build(:deputy, password: nil) }
      it 'is invalid if password is nil' do
        expect(deputy).to be_invalid
        expect(deputy.errors).to include :password
      end
    end

  end
end
