json.array!(@dictionary_entries) do |dictionary_entry|
  json.extract! dictionary_entry, :id, :source_id, :word, :target_id, :dictionary_category_id, :definition, :examples
  json.url admin_dictionary_entry_url(dictionary_entry, format: :json)
end
