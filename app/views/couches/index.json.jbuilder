json.array!(@couches) do |couch|
  json.extract! couch, :id, :name, :couchTypeID, :description, :location, :dateBegin, :dateEnd, :maxHosts, :image
  json.url couch_url(couch, format: :json)
end
