json.array!(@waivers) do |waiver|
  json.extract! waiver, :id, :name, :email, :room
  json.url waiver_url(waiver, format: :json)
end
