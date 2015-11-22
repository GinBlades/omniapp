class Admin::Blog::CommentsController < AdminController
  before_action :set_blog_comment, only: [:show, :edit, :update, :destroy]

  def index
    @blog_comments = ::Blog::Comment.all
  end

  def show
  end

  def new
    @blog_comment = ::Blog::Comment.new
  end

  def edit
  end

  def create
    @blog_comment = ::Blog::Comment.new(blog_comment_params)

    respond_to do |format|
      if @blog_comment.save
        format.html { redirect_to [:admin, @blog_comment], notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @blog_comment] }
      else
        format.html { render :new }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog_comment.update(blog_comment_params)
        format.html { redirect_to [:admin, @blog_comment], notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @blog_comment] }
      else
        format.html { render :edit }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_blog_comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_blog_comment
      @blog_comment = ::Blog::Comment.find(params[:id])
    end

    def blog_comment_params
      params.require(:blog_comment).permit(:name, :email, :body, :approved, :blog_post_id)
    end
end
