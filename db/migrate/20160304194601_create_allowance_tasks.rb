class CreateAllowanceTasks < ActiveRecord::Migration
  def change
    create_table :allowance_tasks do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.string :goal, null: false
      t.string :reward, null: false
      t.integer :days, array: true, default: []
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
