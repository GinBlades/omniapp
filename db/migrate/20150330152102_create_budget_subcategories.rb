class CreateBudgetSubcategories < ActiveRecord::Migration
  def change
    create_table :budget_subcategories do |t|
      t.string :name
      t.string :slug
      t.belongs_to :budget_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
