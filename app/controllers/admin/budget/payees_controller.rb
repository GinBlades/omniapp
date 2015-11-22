module Admin
  class Budget::PayeesController < BudgetController
    before_action :set_budget_payee, only: [:show, :edit, :update, :destroy]

    def index
      @budget_payees = ::Budget::Payee.all
    end

    def show
    end

    def new
      @budget_payee = ::Budget::Payee.new
    end

    def edit
    end

    def create
      @budget_payee = ::Budget::Payee.new(budget_payee_params)

      respond_to do |format|
        if @budget_payee.save
          format.html { redirect_to [:admin, @budget_payee], notice: "Payee was successfully created." }
          format.json { render :show, status: :created, location: [:admin, @budget_payee] }
        else
          format.html { render :new }
          format.json { render json: @budget_payee.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @budget_payee.update(budget_payee_params)
          format.html { redirect_to [:admin, @budget_payee], notice: "Payee was successfully updated." }
          format.json { render :show, status: :ok, location: [:admin, @budget_payee] }
        else
          format.html { render :edit }
          format.json { render json: @budget_payee.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @budget_payee.destroy
      respond_to do |format|
        format.html { redirect_to admin_budget_payees_url, notice: "Payee was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

      def set_budget_payee
        @budget_payee = ::Budget::Payee.find(params[:id])
      end

      def budget_payee_params
        params.require(:budget_payee).permit(:name, :slug)
      end
  end
end
