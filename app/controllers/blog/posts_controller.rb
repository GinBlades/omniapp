class Blog::PostsController < ApplicationController
  def index
    @posts = ::Blog::Post.where('published_at < ?', Time.now) 
  end

  def show
    @post = ::Blog::Post.find(params[:id])
    @comment = ::Blog::Comment.new
  end
end
