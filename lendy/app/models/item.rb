class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_type
  searchkick searchable: [:name, :description, :user]
end
