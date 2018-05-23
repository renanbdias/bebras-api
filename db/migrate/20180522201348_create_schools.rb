class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :cep
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
