json.extract! reservation, :id, :return_date, :returned, :item_id, :user_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
