class AddAttributesToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :name, :string
    rename_column :challenges, :challenge_date, :start_date
    add_column :challenges, :actual_start_date, :datetime

    add_column :challenges, :end_date, :datetime
    add_column :challenges, :actual_end_date, :datetime

    add_column :challenges, :did_start, :boolean, default: false
  end
end
