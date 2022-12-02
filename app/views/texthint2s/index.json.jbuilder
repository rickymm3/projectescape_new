json.array!(@texthint2s) do |texthint2|
  json.extract! texthint2, :id
  json.url texthint2_url(texthint2, format: :json)
end
