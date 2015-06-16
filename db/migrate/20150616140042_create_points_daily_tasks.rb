class CreatePointsDailyTasks < ActiveRecord::Migration
  def change
    create_table :points_daily_tasks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.date :entry_date
      t.string :tasks, array: true, default: []
      t.integer :success, default: 0

      t.timestamps null: false
    end
  end
end
