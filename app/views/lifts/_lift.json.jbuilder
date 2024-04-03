json.extract! lift, :id, :driver_name, :date, :time, :start_location, :destination, :cost, :created_at, :updated_at, :contact_number
json.url lift_url(lift, format: :json)
