json.array!(@dictionary_languages) do |dictionary_language|
  json.extract! dictionary_language, :id, :name
  json.url admin_dictionary_language_url(dictionary_language, format: :json)
end
