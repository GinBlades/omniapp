class CreateHealthEntries < ActiveRecord::Migration
  def change
    create_table :health_entries do |t|
      t.belongs_to :user, index: true
      t.date :entry_date
      t.string :notes

      t.timestamps null: false
    end
    add_foreign_key :health_entries, :users
  end
end
