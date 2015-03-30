class Budget::Payee < ActiveRecord::Base
  include Sluggable
  has_many :budget_entries, class_name: '::Budget::Entry', foreign_key: 'budget_payee_id'
  has_many :budget_events, class_name: '::Budget::Event', foreign_key: 'budget_payee_id'

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    name
  end
end
