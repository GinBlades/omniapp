json.array!(@health_meals) do |health_meal|
  json.extract! health_meal, :id, :time, :meal_category, :calories, :quality, :healthiness, :home, :vegetarian, :cost
  json.url admin_health_meal_url(health_meal, format: :json)
end
