json.array!(@points_options) do |points_option|
  json.extract! points_option, :id, :points_goal_id, :description, :points
  json.url points_option_url(points_option, format: :json)
end
