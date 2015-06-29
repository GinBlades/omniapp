class CreateDictionaryLanguages < ActiveRecord::Migration
  def change
    create_table :dictionary_languages do |t|
      t.string :name
      t.integer :entry_counter
    end
  end
end
