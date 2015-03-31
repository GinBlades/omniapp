json.array!(@notes_categories) do |notes_category|
  json.extract! notes_category, :id, :name, :slug
  json.url notes_category_url(notes_category, format: :json)
end
