class Health::Entry < ActiveRecord::Base
  belongs_to :user
  has_many :health_ratings, class_name: '::Health::Rating'
end
