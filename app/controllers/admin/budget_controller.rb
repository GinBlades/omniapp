class Admin::BudgetController < AdminController
  layout 'app_sidebar'
  before_action do
    @sidebar = 'admin/budget/sidebar'
  end
end
