json.array!(@users) do |user|
  json.extract! user, :id, :name, :lastName, :mail, :password, :admin, :premium
  json.url user_url(user, format: :json)
end
