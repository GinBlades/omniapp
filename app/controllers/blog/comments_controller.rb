class Blog::CommentsController < ApplicationController
  include SetupNegativeCaptcha
  before_action :set_post

  def create
    @comment = @post.blog_comments.build(@captcha.values)

    if @captcha.valid? && @comment.save
      redirect_to blog_post_path(@post), notice: "Comment was successfully submitted."
    else
      flash[:notice] = @captcha.error if @captcha.error
      flash[:notice] = "Please correct the errors below" if @post.errors
      render "blog/posts/show"
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
