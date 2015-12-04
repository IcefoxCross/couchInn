json.array!(@rating_couches) do |rating_couch|
  json.extract! rating_couch, :id
  json.url rating_couch_url(rating_couch, format: :json)
end
