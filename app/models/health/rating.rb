class Health::Rating < ActiveRecord::Base
  belongs_to :health_category, class_name: '::Health::Category'
  belongs_to :health_entry, class_name: '::Health::Entry'
end
