json.array!(@points_goals) do |points_goal|
  json.extract! points_goal, :id, :user_id, :target, :expiration, :completed, :current_points, :points_to_complete, :reward
  json.url points_goal_url(points_goal, format: :json)
end
