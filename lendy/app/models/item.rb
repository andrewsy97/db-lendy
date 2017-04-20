class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_type
  has_many :reservations, dependent: :destroy
  searchkick searchable: [:name, :description, :user]
end
