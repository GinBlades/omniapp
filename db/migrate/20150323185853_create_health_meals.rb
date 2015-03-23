class CreateHealthMeals < ActiveRecord::Migration
  def change
    create_table :health_meals do |t|
      t.belongs_to :user, index: true
      t.datetime :time
      t.integer :meal_category, default: 0
      t.integer :calories
      t.integer :quality
      t.integer :healthiness
      t.boolean :home
      t.boolean :vegetarian
      t.decimal :cost, precision: 12, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :health_workouts, :users
  end
end
