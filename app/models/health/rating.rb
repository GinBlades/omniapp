class Health::Rating < ActiveRecord::Base
  belongs_to :health_category, class_name: '::Health::Category', foreign_key: 'health_category_id'
  belongs_to :health_entry, class_name: '::Health::Entry', foreign_key: 'health_entry_id'
end
