json.array!(@budget_payees) do |budget_payee|
  json.extract! budget_payee, :id, :name, :slug
  json.url admin_budget_payee_url(budget_payee, format: :json)
end
