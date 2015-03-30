json.array!(@budget_entries) do |budget_entry|
  json.extract! budget_entry, :id, :budget_payee_id, :budget_subcategory_id, :price, :notes, :entry_date
  json.url admin_budget_entry_url(budget_entry, format: :json)
end
