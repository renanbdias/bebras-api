class AddDidFinishToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :did_finish, :boolean, default: false
  end
end
