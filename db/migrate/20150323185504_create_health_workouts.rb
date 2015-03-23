class CreateHealthWorkouts < ActiveRecord::Migration
  def change
    create_table :health_workouts do |t|
      t.belongs_to :health_workout_category, index: true
      t.belongs_to :user, index: true
      t.datetime :start
      t.float :duration
      t.float :distance
      t.integer :rating
      t.string :notes

      t.timestamps null: false
    end
    add_foreign_key :health_workouts, :health_workout_categories
    add_foreign_key :health_workouts, :users
  end
end
