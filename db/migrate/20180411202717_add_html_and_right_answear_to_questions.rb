class AddHtmlAndRightAnswearToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :html, :text

    add_column :questions, :right_alternative_id, :integer
    add_index :questions, :right_alternative_id
  end
end