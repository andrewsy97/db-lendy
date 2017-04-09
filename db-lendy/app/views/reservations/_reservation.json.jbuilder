json.extract! reservation, :id, :return_date, :returned, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
