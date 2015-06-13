class CreatePointsActivities < ActiveRecord::Migration
  def change
    create_table :points_activities do |t|
      t.belongs_to :points_option, index: true, foreign_key: true
      t.date :entry_date
      t.string :note

      t.timestamps null: false
    end
  end
end
