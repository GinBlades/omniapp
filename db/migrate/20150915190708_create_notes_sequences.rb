class CreateNotesSequences < ActiveRecord::Migration
  def change
    create_table :notes_sequences do |t|
      t.string :name
      t.belongs_to :notes_category, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end

    add_column :notes_entries, :notes_sequence_id, :integer
    add_index :notes_entries, :notes_sequence_id
    add_foreign_key :notes_entries, :notes_sequences
  end
end
