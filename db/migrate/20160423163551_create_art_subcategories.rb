class CreateArtSubcategories < ActiveRecord::Migration
  def change
    create_table :art_subcategories do |t|
      t.belongs_to :art_category, index: true, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :art_subcategories, [:art_category_id, :name], unique: true
  end
end
