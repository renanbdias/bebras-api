require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'validations' do
    context 'when competitor is nil' do
      subject(:exam) { build(:exam, competitor: nil) }
      it 'is invalid if competitor is nil' do
        expect(exam).to be_invalid
        expect(exam.errors).to include :competitor
      end
    end

    # context 'when questions are nil' do
    #   subject(:exam) { build(:exam, questions: []) }
    #   it 'is invalid if questions is nil' do
    #     expect(exam).to be_invalid
    #     expect(exam.errors).to include :questions
    #   end
    # end
  end
end
