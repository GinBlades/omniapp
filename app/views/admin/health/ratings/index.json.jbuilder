json.array!(@health_ratings) do |health_rating|
  json.extract! health_rating, :id, :health_category_id, :health_entry_id
  json.url health_rating_url(health_rating, format: :json)
end
