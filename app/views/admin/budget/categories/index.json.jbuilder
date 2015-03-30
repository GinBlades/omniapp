json.array!(@budget_categories) do |budget_category|
  json.extract! budget_category, :id, :name, :slug
  json.url admin_budget_category_url(budget_category, format: :json)
end
