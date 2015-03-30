class Budget::Entry < ActiveRecord::Base
  belongs_to :budget_payee, class_name: '::Budget::Payee'
  belongs_to :budget_subcategory, class_name: '::Budget::Subcategory'
end
