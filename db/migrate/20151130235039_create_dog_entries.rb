class CreateDogEntries < ActiveRecord::Migration
  def change
    create_table :dog_entries do |t|
      t.datetime :entry_date
      t.string :notes

      t.timestamps null: false
    end
  end
end
