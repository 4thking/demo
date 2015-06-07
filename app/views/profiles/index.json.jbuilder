json.array!(@profiles) do |profile|
  json.extract! profile, :id, :description, :steam, :mmr, :carry, :mid, :support, :offlane, :jungle
  json.url profile_url(profile, format: :json)
end
