json.array!(@health_categories) do |health_category|
  json.extract! health_category, :id, :name
  json.url health_category_url(health_category, format: :json)
end
