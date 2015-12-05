json.array!(@rating_users) do |rating_user|
  json.extract! rating_user, :id
  json.url rating_user_url(rating_user, format: :json)
end
