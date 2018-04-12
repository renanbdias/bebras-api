class CreateAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :alternatives do |t|
      t.string :alternative_symbol
      t.string :description

      t.text :html_text

      t.references :question, index: true, foreign_key: true
      t.timestamps
    end
  end
end
