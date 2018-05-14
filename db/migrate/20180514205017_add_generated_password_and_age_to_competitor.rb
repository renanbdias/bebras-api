class AddGeneratedPasswordAndAgeToCompetitor < ActiveRecord::Migration[5.1]
  def change
    add_column :competitors, :generated_password, :string
    add_column :competitors, :age, :integer
  end
end
