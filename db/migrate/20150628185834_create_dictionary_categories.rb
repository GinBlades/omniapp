class CreateDictionaryCategories < ActiveRecord::Migration
  def change
    create_table :dictionary_categories do |t|
      t.string :name
      t.integer :entry_counter
    end
  end
end
