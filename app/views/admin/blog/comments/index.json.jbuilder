json.array!(@blog_comments) do |blog_comment|
  json.extract! blog_comment, :id, :name, :email, :body, :approved, :blog_post_id
  json.url admin_blog_comment_url(blog_comment, format: :json)
end
