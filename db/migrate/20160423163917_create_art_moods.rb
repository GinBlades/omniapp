class CreateArtMoods < ActiveRecord::Migration
  def change
    create_table :art_moods do |t|
      t.string :name, null: false

      t.timestamps null: false
      t.index :name, unique: true
    end
  end
end
