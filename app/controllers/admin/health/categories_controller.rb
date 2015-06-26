class Admin::Health::CategoriesController < AdminController
  before_action :set_health_category, only: [:show, :edit, :update, :destroy]

  def index
    @health_categories = ::Health::Category.all
  end

  def show
  end

  def new
    @health_category = ::Health::Category.new
  end

  def edit
  end

  def create
    @health_category = ::Health::Category.new(health_category_params)

    respond_to do |format|
      if @health_category.save
        format.html { redirect_to [:admin, @health_category], notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @health_category] }
      else
        format.html { render :new }
        format.json { render json: @health_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @health_category.update(health_category_params)
        format.html { redirect_to [:admin, @health_category], notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @health_category] }
      else
        format.html { render :edit }
        format.json { render json: @health_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @health_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_health_categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_health_category
    @health_category = ::Health::Category.find(params[:id])
  end

  def health_category_params
    params.require(:health_category).permit(:name)
  end
end
