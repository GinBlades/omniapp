class CreateNotesEntries < ActiveRecord::Migration
  def change
    create_table :notes_entries do |t|
      t.string :name
      t.string :slug, null: false
      t.string :body
      t.belongs_to :notes_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
