class AddHtmlAndRightAnswearToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :html, :text
    # add_reference :questions, :alternative, index: true, foreign_key: true
    # add_reference :questions, :alternative, index: true, foreign_key: true

    add_column :questions, :right_alternative_id, :integer
    add_index :questions, :right_alternative_id

    add_column :questions, :selected_alternative_id, :integer
    add_index :questions, :selected_alternative_id

    # add_column :people, :foo_bar_store_id, :integer
    # add_index :people, :foo_bar_store_id
    # class Person < ActiveRecord::Base
    #   has_one :store, foreign_key: 'foo_bar_store_id'
    # end
  end
end
