json.array!(@points_activities) do |points_activity|
  json.extract! points_activity, :id, :points_option_id, :entry_date, :note
  json.url points_activity_url(points_activity, format: :json)
end
