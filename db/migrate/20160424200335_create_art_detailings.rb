class CreateArtDetailings < ActiveRecord::Migration
  def change
    create_table :art_detailings do |t|
      t.references :detailable, polymorphic: true, index: true, null: false
      t.belongs_to :art_detail, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    add_index :art_detailings, [:detailable_type, :detailable_id, :art_detail_id], unique: true, name: "art_detailings_unique_index"
  end
end
