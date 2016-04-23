class CreateArtGenres < ActiveRecord::Migration
  def change
    create_table :art_genres do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
