module Admin
  class Budget::EntriesController < BudgetController
    before_action :set_budget_entry, only: [:show, :edit, :update, :destroy]

    def index
      @budget_entries = ::Budget::Entry.all
    end

    def show
    end

    def new
      @budget_entry = ::Budget::Entry.new
    end

    def edit
    end

    def create
      @budget_entry = current_user.budget_entries.build(budget_entry_params)

      respond_to do |format|
        if @budget_entry.save
          format.html { redirect_to [:admin, @budget_entry], notice: 'Entry was successfully created.' }
          format.json { render :show, status: :created, location: [:admin, @budget_entry] }
        else
          format.html { render :new }
          format.json { render json: @budget_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @budget_entry.update(budget_entry_params)
          format.html { redirect_to [:admin, @budget_entry], notice: 'Entry was successfully updated.' }
          format.json { render :show, status: :ok, location: [:admin, @budget_entry] }
        else
          format.html { render :edit }
          format.json { render json: @budget_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @budget_entry.destroy
      respond_to do |format|
        format.html { redirect_to admin_budget_entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_budget_entry
      @budget_entry = ::Budget::Entry.find(params[:id])
    end

    def budget_entry_params
      params.require(:budget_entry).permit(:budget_payee_id, :budget_subcategory_id, :price, :notes, :entry_date, :allowance)
    end
  end
end
