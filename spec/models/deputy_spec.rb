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
  end
end
