class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :item_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
