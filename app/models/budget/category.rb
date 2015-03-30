class Budget::Category < ActiveRecord::Base
  include Sluggable
  has_many :budget_subcategories, class_name: '::Budget::Subcategory', foreign_key: 'budget_category_id'
end
