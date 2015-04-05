class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title, null: false
      t.string :slug, null: false
      t.string :excerpt
      t.string :body
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
