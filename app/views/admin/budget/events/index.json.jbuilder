json.array!(@budget_events) do |budget_event|
  json.extract! budget_event, :id, :budget_payee_id, :event_date, :price, :recurring, :event_action, :urladmin_, :alert_date
  json.url budget_event_url(budget_event, format: :json)
end
