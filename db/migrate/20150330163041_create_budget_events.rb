class CreateBudgetEvents < ActiveRecord::Migration
  def change
    create_table :budget_events do |t|
      t.belongs_to :budget_payee, index: true, foreign_key: true
      t.date :event_date
      t.decimal :price, precision: 12, scale: 2
      t.boolean :recurring
      t.integer :recurring_interval
      t.string :event_action
      t.string :url
      t.date :alert_date

      t.timestamps null: false
    end
  end
end
