require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
    context 'when name is nil' do
      subject(:school) { build(:school, name: nil) }
      it 'is invalid if name is nil' do
        expect(school).to be_invalid
        expect(school.errors).to include :name
      end
    end

    context 'when phone is nil' do
      subject(:school) { build(:school, phone: nil) }
      it 'is invalid if phone is nil' do
        expect(school).to be_invalid
        expect(school.errors).to include :phone
      end
    end

    context 'when address is nil' do
      subject(:school) { build(:school, address: nil) }
      it 'is invalid if address is nil' do
        expect(school).to be_invalid
        expect(school.errors).to include :address
      end
    end

    context 'when cep is nil' do
      subject(:school) { build(:school, cep: nil) }
      it 'is invalid if cep is nil' do
        expect(school).to be_invalid
        expect(school.errors).to include :cep
      end
    end

    context 'when city is nil' do
      subject(:school) { build(:school, city: nil) }
      it 'is invalid if city is nil' do
        expect(school).to be_invalid
        expect(school.errors).to include :city
      end
    end

    context 'when state is nil' do
      subject(:school) { build(:school, state: nil) }
      it 'is invalid if state is nil' do
        expect(school).to be_invalid
        expect(school.errors).to include :state
      end
    end
  end
end
