class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :return_date
      t.boolean :returned

      t.timestamps null: false
    end
  end
end
