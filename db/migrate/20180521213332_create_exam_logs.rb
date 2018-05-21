class CreateExamLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_logs do |t|
      t.text :error

      t.timestamps
    end
  end
end
