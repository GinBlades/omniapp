class CreateHealthCategories < ActiveRecord::Migration
  def change
    create_table :health_categories do |t|
      t.string :name
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :health_categories, :slug, unique: true
  end
end
