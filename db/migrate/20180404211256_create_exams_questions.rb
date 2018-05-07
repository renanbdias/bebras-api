class CreateExamsQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :exams_questions do |t|
      t.references :exam, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps
    end

    remove_reference :questions, :exam, index: true, foreign_key: true
    remove_reference :competitors, :exam, index: true, foreign_key: true
  end
end