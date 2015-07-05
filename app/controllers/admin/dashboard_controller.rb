class Admin::DashboardController < AdminController
  def index
    @blog_posts = current_user.blog_posts
  end
end
