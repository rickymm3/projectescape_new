json.array!(@corporates) do |corporate|
  json.extract! corporate, :id
  json.url corporate_url(corporate, format: :json)
end
