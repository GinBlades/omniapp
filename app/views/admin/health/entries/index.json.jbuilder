json.array!(@health_entries) do |health_entry|
  json.extract! health_entry, :id, :user_id, :entry_date, :notes
  json.url admin_health_entry_url(health_entry, format: :json)
end
