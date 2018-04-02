class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.references :competitor, index: true, foreign_key: true

      t.timestamps
    end

    add_reference :competitors, :exam, index: true, foreign_key: true
  end
end