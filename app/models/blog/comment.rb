class Blog::Comment < ActiveRecord::Base
  belongs_to :blog_post, class_name: '::Blog::Post'

  validates :blog_post_id, :email, :body, presence: true
end
