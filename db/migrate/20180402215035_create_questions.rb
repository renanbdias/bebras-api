class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :difficulty
      t.integer :age_group
      # t.category uma questão pode pertencer a várias categorias
      t.text :explanation
      t.text :title
      # Imagens

      t.references :exam, index: true, foreign_key: true
      t.timestamps
    end
  end
end
