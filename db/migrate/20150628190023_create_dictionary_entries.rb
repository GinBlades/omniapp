class CreateDictionaryEntries < ActiveRecord::Migration
  def change
    create_table :dictionary_entries do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :source, index: true
      t.belongs_to :target, index: true
      t.belongs_to :dictionary_category, index: true, foreign_key: true
      t.string :word
      t.string :definition
      t.string :examples
      t.string :notes

      t.timestamps null: false
    end

    add_foreign_key :dictionary_entries, :dictionary_languages, column: :source_id
    add_foreign_key :dictionary_entries, :dictionary_languages, column: :target_id
  end
end
