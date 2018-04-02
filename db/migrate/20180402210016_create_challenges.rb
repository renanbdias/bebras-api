class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.datetime :challenge_date

      t.references :deputy, index: true, foreign_key: true
      t.timestamps
    end

    add_reference :competitors, :challenge, index: true, foreign_key: true
  end
end
