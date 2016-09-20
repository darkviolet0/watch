json.extract! site, :id, :location, :latitude, :longitude, :description, :theme_id, :created_at, :updated_at
json.url site_url(site, format: :json)