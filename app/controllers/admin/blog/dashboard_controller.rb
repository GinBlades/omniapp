class Admin::Blog::DashboardController < ApplicationController
  def index
    @posts = ::Blog::Post.order(published_at: :desc).limit(5)
    @comments = ::Blog::Comment.order(created_at: :desc).limit(5)
  end
end
