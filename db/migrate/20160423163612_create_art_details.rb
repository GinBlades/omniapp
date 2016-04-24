class CreateArtDetails < ActiveRecord::Migration
  def change
    create_table :art_details do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
