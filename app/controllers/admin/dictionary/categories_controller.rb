class Admin::Dictionary::CategoriesController < AdminController
  before_action :set_dictionary_category, only: [:show, :edit, :update, :destroy]

  def index
    @dictionary_categories = ::Dictionary::Category.all
  end

  def show
    @q = ::Dictionary::Entry.ransack(params[:q])
    @entries = @q.result(uniq: true).where(dictionary_category: @dictionary_category)
               .includes(:dictionary_category, :source, :target)
  end

  def new
    @dictionary_category = ::Dictionary::Category.new
  end

  def edit
  end

  def create
    @dictionary_category = ::Dictionary::Category.new(dictionary_category_params)

    respond_to do |format|
      if @dictionary_category.save
        format.html { redirect_to [:admin, @dictionary_category], notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @dictionary_category] }
      else
        format.html { render :new }
        format.json { render json: @dictionary_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dictionary_category.update(dictionary_category_params)
        format.html { redirect_to [:admin, @dictionary_category], notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @dictionary_category] }
      else
        format.html { render :edit }
        format.json { render json: @dictionary_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dictionary_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_dictionary_categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_dictionary_category
      @dictionary_category = ::Dictionary::Category.find(params[:id])
    end

    def dictionary_category_params
      params.require(:dictionary_category).permit(:name)
    end
end
