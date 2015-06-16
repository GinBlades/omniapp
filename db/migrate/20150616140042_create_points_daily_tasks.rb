class CreatePointsDailyTasks < ActiveRecord::Migration
  def change
    create_table :points_daily_tasks do |t|
      t.date :entry_date
      t.string :tasks, array: true, default: []
      t.integer :success, default: 0

      t.timestamps null: false
    end
  end
end
