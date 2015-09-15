json.array!(@notes_sequences) do |notes_sequence|
  json.extract! notes_sequence, :id, :name, :notes_category_id, :description
  json.url notes_sequence_url(notes_sequence, format: :json)
end
