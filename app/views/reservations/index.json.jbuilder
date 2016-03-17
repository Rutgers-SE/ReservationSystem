json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :start, :finish, :customers_id
  json.url reservation_url(reservation, format: :json)
end
