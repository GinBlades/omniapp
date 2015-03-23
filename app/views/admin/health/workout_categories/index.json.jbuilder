json.array!(@health_workout_categories) do |health_workout_category|
  json.extract! health_workout_category, :id, :name, :slug
  json.url admin_health_workout_category_url(health_workout_category, format: :json)
end
