json.array!(@notes_entries) do |notes_entry|
  json.extract! notes_entry, :id, :name, :slug, :body, :notes_category_id
  json.url notes_entry_url(notes_entry, format: :json)
end
