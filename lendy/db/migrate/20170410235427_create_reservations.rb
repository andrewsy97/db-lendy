class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :return_date
      t.boolean :returned
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
