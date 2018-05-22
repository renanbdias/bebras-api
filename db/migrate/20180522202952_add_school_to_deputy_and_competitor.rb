class AddSchoolToDeputyAndCompetitor < ActiveRecord::Migration[5.1]
  def change
    add_reference :deputies, :school, index: true, foreign_key: true
    add_reference :competitors, :school, index: true, foreign_key: true
  end
end
