json.array!(@health_workouts) do |health_workout|
  json.extract! health_workout, :id, :health_workout_category_id, :user_id, :start, :duration, :distance, :rating, :notes
  json.url admin_health_workout_url(health_workout, format: :json)
end
