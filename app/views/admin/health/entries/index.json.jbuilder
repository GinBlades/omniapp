json.array!(@health_entries) do |health_entry|
  json.extract! health_entry, :id, :user_id, :entry_date, :notes
  json.url health_entry_url(health_entry, format: :json)
end
