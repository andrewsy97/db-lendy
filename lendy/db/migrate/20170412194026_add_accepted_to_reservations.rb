class AddAcceptedToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :accepted, :boolean
  end
end
