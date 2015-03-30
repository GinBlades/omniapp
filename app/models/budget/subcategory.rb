class Budget::Subcategory < ActiveRecord::Base
  include Sluggable
  belongs_to :budget_category, class_name: '::Budget::Category'
  has_many :budget_entries, class_name: '::Budget::Entry', foreign_key: 'budget_subcategory_id'

  validates :name, presence: true

  def label
    "#{budget_category.name}: #{name}"
  end

  def to_s
    label
  end
end
