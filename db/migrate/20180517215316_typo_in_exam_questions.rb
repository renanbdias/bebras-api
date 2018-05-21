class TypoInExamQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_reference :exams_questions, :alternatives, index: true, foreign_key: true
    add_reference :exams_questions, :alternative, index: true, foreign_key: true
  end
end
