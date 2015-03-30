class CreateBudgetCategories < ActiveRecord::Migration
  def change
    create_table :budget_categories do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
