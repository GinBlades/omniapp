class CreateBudgetEntries < ActiveRecord::Migration
  def change
    create_table :budget_entries do |t|
      t.belongs_to :budget_payee, index: true, foreign_key: true
      t.belongs_to :budget_subcategory, index: true, foreign_key: true
      t.decimal :price, precision: 12, scale: 2
      t.string :notes
      t.date :entry_date

      t.timestamps null: false
    end
  end
end
