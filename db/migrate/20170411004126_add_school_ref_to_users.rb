class AddSchoolRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :school, index: true, column: :school_id_fk, foreign_key: true
  end
end
