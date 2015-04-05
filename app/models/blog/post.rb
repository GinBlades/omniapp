class Blog::Post < ActiveRecord::Base
  belongs_to :user
  has_many :blog_comments, class_name: '::Blog::Comment', foreign_key: 'blog_post_id', dependent: :destroy
end
