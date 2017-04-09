class AddItemRefToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :item, index: true, foreign_key: true
  end
end
