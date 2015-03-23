class CreateHealthRatings < ActiveRecord::Migration
  def change
    create_table :health_ratings do |t|
      t.belongs_to :health_category, index: true
      t.belongs_to :health_entry, index: true

      t.timestamps null: false
    end
    add_foreign_key :health_ratings, :health_categories
    add_foreign_key :health_ratings, :health_entries
  end
end
