json.array!(@health_entries) do |health_entry|
  json.extract! health_entry, :id, :user_id, :entry_date, :notes, :name
  json.url admin_health_entry_url(health_entry)
end
