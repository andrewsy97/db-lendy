class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :return_date
      t.boolean :returned
      t.belongs_to :item, index: true, foreign_key: true, column: :item_id_fk, on_delete: :cascade
      t.belongs_to :user, index: true, foreign_key: true, column: :user_id_fk, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
