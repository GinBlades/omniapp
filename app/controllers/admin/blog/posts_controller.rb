class Admin::Blog::PostsController < AdminController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = ::Blog::Post.all
  end

  def show
  end

  def new
    @blog_post = ::Blog::Post.new
  end

  def edit
  end

  def create
    @blog_post = ::Blog::Post.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to [:admin, @blog_post], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @blog_post] }
      else
        format.html { render :new }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to [:admin, @blog_post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @blog_post] }
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_blog_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_blog_post
    @blog_post = ::Blog::Post.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:user_id, :title, :slug, :excerpt, :body, :published_at, :tag_list)
  end
end
