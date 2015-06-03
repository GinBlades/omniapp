class Budget::Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :budget_payee, class_name: '::Budget::Payee'
  belongs_to :budget_subcategory, class_name: '::Budget::Subcategory'

  after_save :update_user_allowance
  after_destroy :update_user_allowance

  def to_s
    "#{budget_subcategory} - #{budget_payee}: #{price}"
  end

  protected

  def update_user_allowance
    return unless allowance?
    monthly_spending = user.budget_entries_for_month(Time.zone.now).sum(:price)
    user.current_allowance = 100 - monthly_spending
    user.save
  end
end
