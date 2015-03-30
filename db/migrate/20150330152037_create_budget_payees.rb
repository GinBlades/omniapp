class CreateBudgetPayees < ActiveRecord::Migration
  def change
    create_table :budget_payees do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
