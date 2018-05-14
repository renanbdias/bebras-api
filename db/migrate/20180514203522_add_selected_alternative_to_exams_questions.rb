class AddSelectedAlternativeToExamsQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :exams_questions, :alternatives, index: true, foreign_key: true
  end
end