json.array!(@points_daily_tasks) do |points_daily_task|
  json.extract! points_daily_task, :id, :entry_date, :tasks, :success
  json.url points_daily_task_url(points_daily_task, format: :json)
end
