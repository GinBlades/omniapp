json.array!(@budget_subcategories) do |budget_subcategory|
  json.extract! budget_subcategory, :id, :name, :slug, :budget_category_id
  json.url admin_budget_subcategory_url(budget_subcategory, format: :json)
end
