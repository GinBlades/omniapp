class CreatePointsGoals < ActiveRecord::Migration
  def change
    create_table :points_goals do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :target, null: false
      t.date :expiration
      t.boolean :completed, default: false
      t.integer :current_points, default: 0
      t.integer :points_to_complete, default: 50
      t.string :reward

      t.timestamps null: false
    end
  end
end
