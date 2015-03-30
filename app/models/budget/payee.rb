class Budget::Payee < ActiveRecord::Base
  include Sluggable
  has_many :budget_entries, class_name: '::Budget::Entry', foreign_key: 'budget_payee_id'
end
