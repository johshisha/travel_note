json.extract! record, :id, :title, :user_id, :description, :latitude, :longitude, :start_date, :end_date, :url, :created_at, :updated_at
json.url record_url(record, format: :json)
