json.array!(@tanks) do |tank|
  json.extract! tank, :id, :name, :year, :country_id, :type_id
  json.url tank_url(tank, format: :json)
end
