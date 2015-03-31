class CreateNotesCategories < ActiveRecord::Migration
  def change
    create_table :notes_categories do |t|
      t.string :name
      t.string :slug, null: false

      t.timestamps null: false
    end
  end
end
