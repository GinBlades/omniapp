class Blog::Comment < ActiveRecord::Base
  belongs_to :blog_post, class_name: '::Blog::Post'
end
