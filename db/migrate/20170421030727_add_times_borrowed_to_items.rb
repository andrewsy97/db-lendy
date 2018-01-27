class AddTimesBorrowedToItems < ActiveRecord::Migration
  def change
    add_column :items, :times_borrowed, :integer, default: 0
  end
end
