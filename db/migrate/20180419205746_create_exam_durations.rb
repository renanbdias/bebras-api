class CreateExamDurations < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_durations do |t|
      t.integer :exam_duration_in_minutes

      t.timestamps
    end
  end
end
