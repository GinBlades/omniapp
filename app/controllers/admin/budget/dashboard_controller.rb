module Admin
  class Budget::DashboardController < BudgetController
    def index
      @recent_entries = ::Budget::Entry.order(entry_date: :desc)
                        .includes(:user, :budget_payee, budget_subcategory: :budget_category)
    end
  end
end
