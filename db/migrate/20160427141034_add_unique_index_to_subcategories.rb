class AddUniqueIndexToSubcategories < ActiveRecord::Migration
  def change
    # add_index :art_subcategories, [:art_category_id, :name], unique: true
  end
end
