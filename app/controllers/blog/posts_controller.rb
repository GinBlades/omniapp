class Blog::PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = ::Blog::Post.published.tagged_with(params[:tag])
    else
      @posts = ::Blog::Post.published
    end
  end

  def show
    @post = ::Blog::Post.find(params[:id])
    @comment = ::Blog::Comment.new
  end
end
