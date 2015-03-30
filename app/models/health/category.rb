class Health::Category < ActiveRecord::Base
  include Sluggable
  has_many :health_ratings, class_name: '::Health::Rating', foreign_key: 'health_category_id'

  def to_s
    name
  end
end
