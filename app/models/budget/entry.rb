class Budget::Entry < ActiveRecord::Base
  belongs_to :budget_payee, class_name: '::Budget::Payee'
  belongs_to :budget_subcategory, class_name: '::Budget::Subcategory'

  def to_s
    "#{budget_subcategory} - #{budget_payee}: #{price}"
  end
end
