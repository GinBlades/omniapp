class CreateArtDetails < ActiveRecord::Migration
  def change
    create_table :art_details do |t|
      t.belongs_to :art_subcategory, index: true, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
