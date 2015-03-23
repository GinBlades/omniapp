class CreateHealthWorkoutCategories < ActiveRecord::Migration
  def change
    create_table :health_workout_categories do |t|
      t.string :name
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :health_workout_categories, :slug, unique: true
  end
end
