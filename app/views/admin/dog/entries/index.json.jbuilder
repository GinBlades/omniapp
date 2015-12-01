json.array!(@dog_entries) do |dog_entry|
  json.extract! dog_entry, :id, :entry_date, :notes
  json.url admin_dog_entry_url(dog_entry, format: :json)
end
