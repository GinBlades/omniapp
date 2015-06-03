module Admin
  class Budget::SubcategoriesController < BudgetController
    before_action :set_budget_subcategory, only: [:show, :edit, :update, :destroy]

    def index
      @budget_subcategories = ::Budget::Subcategory.includes(:budget_category)
    end

    def show
    end

    def new
      @budget_subcategory = ::Budget::Subcategory.new
    end

    def edit
    end

    def create
      @budget_subcategory = ::Budget::Subcategory.new(budget_subcategory_params)

      respond_to do |format|
        if @budget_subcategory.save
          format.html { redirect_to [:admin,@budget_subcategory], notice: 'Subcategory was successfully created.' }
          format.json { render :show, status: :created, location: [:admin,@budget_subcategory] }
        else
          format.html { render :new }
          format.json { render json: @budget_subcategory.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @budget_subcategory.update(budget_subcategory_params)
          format.html { redirect_to [:admin,@budget_subcategory], notice: 'Subcategory was successfully updated.' }
          format.json { render :show, status: :ok, location: [:admin,@budget_subcategory] }
        else
          format.html { render :edit }
          format.json { render json: @budget_subcategory.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @budget_subcategory.destroy
      respond_to do |format|
        format.html { redirect_to admin_budget_subcategories_url, notice: 'Subcategory was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_budget_subcategory
        @budget_subcategory = ::Budget::Subcategory.find(params[:id])
      end

      def budget_subcategory_params
        params.require(:budget_subcategory).permit(:name, :slug, :budget_category_id)
      end
  end
end
