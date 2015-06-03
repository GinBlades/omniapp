class AddAllowanceToBudgetEntries < ActiveRecord::Migration
  def change
    add_column :budget_entries, :allowance, :boolean, default: false
    add_reference :budget_entries, :user, index: true, foreign_key: true

    add_column :users, :past_allowance, :decimal, precision: 12, scale: 2, default: 0
    add_column :users, :current_allowance, :decimal, precision: 12, scale: 2, default: 0
  end
end
