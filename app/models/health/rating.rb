class Health::Rating < ActiveRecord::Base
  belongs_to :health_category
  belongs_to :health_entry
end
