require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'validations' do
    context 'when competitor_id is nil' do
      subject(:exam) { build(:exam, competitor_id: nil) }
      it 'is invalid if exam_date is nil' do
        expect(exam).to be_invalid
        expect(exam.errors).to include :competitor_id
      end
    end
  end
end
