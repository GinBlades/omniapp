json.array!(@allowance_entries) do |allowance_entry|
  json.extract! allowance_entry, :id, :user_id, :entry_date, :price, :payee, :category, :notes
  json.url admin_allowance_entry_url(allowance_entry, format: :json)
end
