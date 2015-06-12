module Admin
  class Budget::CategoriesController < BudgetController
    before_action :set_budget_category, only: [:show, :edit, :update, :destroy]

    def index
      @budget_categories = ::Budget::Category.all
    end

    def show
    end

    def new
      @budget_category = ::Budget::Category.new
    end

    def edit
    end

    def create
      @budget_category = ::Budget::Category.new(budget_category_params)

      respond_to do |format|
        if @budget_category.save
          format.html { redirect_to [:admin, @budget_category], notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: [:admin, @budget_category] }
        else
          format.html { render :new }
          format.json { render json: @budget_category.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @budget_category.update(budget_category_params)
          format.html { redirect_to [:admin, @budget_category], notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: [:admin, @budget_category] }
        else
          format.html { render :edit }
          format.json { render json: @budget_category.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @budget_category.destroy
      respond_to do |format|
        format.html { redirect_to admin_budget_categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_budget_category
      @budget_category = ::Budget::Category.find(params[:id])
    end

    def budget_category_params
      params.require(:budget_category).permit(:name, :slug)
    end
  end
end
