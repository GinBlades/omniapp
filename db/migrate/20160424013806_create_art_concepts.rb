class CreateArtConcepts < ActiveRecord::Migration
  def change
    create_table :art_concepts do |t|
      t.belongs_to :art_subcategory, index: true, foreign_key: true
      t.belongs_to :art_mood, index: true, foreign_key: true
      t.belongs_to :art_genre, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :sources

      t.timestamps null: false
    end
  end
end
