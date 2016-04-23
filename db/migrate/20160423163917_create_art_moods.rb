class CreateArtMoods < ActiveRecord::Migration
  def change
    create_table :art_moods do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
