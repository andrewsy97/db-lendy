class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_type
  has_many :reservations, dependent: :destroy
  searchkick searchable: [:name, :description, :user]

  def available
    self.reservations.each() do |r|
      if not r.returned
        return false
      end
    end
    return true
  end
end
