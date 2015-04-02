class Health::Category < ActiveRecord::Base
  include Sluggable
  has_many :health_ratings, class_name: '::Health::Rating'

  default_scope { order(:name) }

  def to_s
    name
  end
end
