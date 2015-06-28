json.array!(@dictionary_categories) do |dictionary_category|
  json.extract! dictionary_category, :id, :name
  json.url admin_dictionary_category_url(dictionary_category, format: :json)
end
