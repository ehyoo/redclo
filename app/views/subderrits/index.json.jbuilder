json.array!(@subderrits) do |subderrit|
  json.extract! subderrit, :id, :name
  json.url subderrit_url(subderrit, format: :json)
end
