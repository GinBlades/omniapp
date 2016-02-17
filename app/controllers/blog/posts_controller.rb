class Blog::PostsController < ApplicationController
  include SetupNegativeCaptcha

  def index
    @posts = if params[:tag]
               ::Blog::Post.published.tagged_with(params[:tag])
             else
               ::Blog::Post.published
             end
  end

  def show
    @post = ::Blog::Post.find(params[:id])
    @comment = ::Blog::Comment.new
  end
end
