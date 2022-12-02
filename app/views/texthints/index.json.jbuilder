json.array!(@texthints) do |texthint|
  json.extract! texthint, :id, :message
  json.url texthint_url(texthint, format: :json)
end
