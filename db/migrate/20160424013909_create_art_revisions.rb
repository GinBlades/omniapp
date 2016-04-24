class CreateArtRevisions < ActiveRecord::Migration
  def change
    create_table :art_revisions do |t|
      t.belongs_to :art_concept, index: true, foreign_key: true, null: false
      t.float :version, default: 0.1
      t.string :image
      t.string :notes

      t.timestamps null: false
    end
  end
end
