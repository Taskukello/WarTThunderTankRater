json.array!(@weapons) do |weapon|
  json.extract! weapon, :id, :name, :size, :year
  json.url weapon_url(weapon, format: :json)
end
