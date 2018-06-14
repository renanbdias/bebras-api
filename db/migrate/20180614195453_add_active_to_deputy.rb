class AddActiveToDeputy < ActiveRecord::Migration[5.1]
  def change
    add_column :deputies, :active, :boolean, default: false
  end
end
