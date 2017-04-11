json.extract! item, :id, :description, :user_id, :item_type_id, :created_at, :updated_at
json.url item_url(item, format: :json)
