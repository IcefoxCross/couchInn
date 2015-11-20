json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :start_date, :end_date, :confirmed
  json.url reservation_url(reservation, format: :json)
end
