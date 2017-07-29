json.extract! drive_datum, :id, :user_id, :stats, :start_time, :end_time, :start_loc, :end_loc, :created_at, :updated_at
json.url drive_datum_url(drive_datum, format: :json)
