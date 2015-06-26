class Blog::CommentsController < ApplicationController
  before_action :set_post

  def new
    @blog_comment = ::Blog::Comment.new
  end

  def create
    @blog_comment = @post.blog_comments.build(blog_comment_params)

    if @blog_comment.save
      redirect_to blog_post_path(@post), notice: "Comment was successfully submitted."
    else
      render :new
    end
  end

  private

  def set_post
    @post = ::Blog::Post.find(params[:post_id])
  end

  def blog_comment_params
    params.require(:blog_comment).permit(:name, :email, :body)
  end
end
