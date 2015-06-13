class CreatePointsOptions < ActiveRecord::Migration
  def change
    create_table :points_options do |t|
      t.belongs_to :points_goal, index: true, foreign_key: true
      t.string :description, null: false
      t.integer :points, default: 1

      t.timestamps null: false
    end
  end
end
