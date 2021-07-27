json.extract! listing, :id, :name, :artist_id, :price, :description, :images, :status, :seller_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.images do
  json.array!(listing.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
