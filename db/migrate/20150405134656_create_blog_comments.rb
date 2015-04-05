class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.string :name
      t.string :email, null: false
      t.string :body, null: false
      t.boolean :approved, default: false
      t.belongs_to :blog_post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
