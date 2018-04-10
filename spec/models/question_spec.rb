require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    context 'when name is nil' do
      subject(:question) { build(:question, name: nil) }
      it 'is invalid if name is nil' do
        expect(question).to be_invalid
        expect(question.errors).to include :name
      end
    end

    context 'when difficulty is nil' do
      subject(:question) { build(:question, difficulty: nil) }
      it 'is invalid if difficulty is nil' do
        expect(question).to be_invalid
        expect(question.errors).to include :difficulty
      end
    end

    context 'when difficulty is nil' do
      subject(:question) { build(:question, difficulty: nil) }
      it 'is invalid if difficulty is nil' do
        expect(question).to be_invalid
        expect(question.errors).to include :difficulty
      end
    end

    context 'when age_group is nil' do
      subject(:question) { build(:question, age_group: nil) }
      it 'is invalid if age_group is nil' do
        expect(question).to be_invalid
        expect(question.errors).to include :age_group
      end
    end

    context 'when explanation is nil' do
      subject(:question) { build(:question, explanation: nil) }
      it 'is invalid if explanation is nil' do
        expect(question).to be_invalid
        expect(question.errors).to include :explanation
      end
    end

    context 'when title is nil' do
      subject(:question) { build(:question, title: nil) }
      it 'is invalid if title is nil' do
        expect(question).to be_invalid
        expect(question.errors).to include :title
      end
    end

  end
end
