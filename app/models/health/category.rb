class Health::Category < ActiveRecord::Base
  has_many :health_ratings, class_name: '::Health::Rating'

  before_save :make_slug

  def make_slug
    self.slug = name.parameterize
  end

  def to_s
    name
  end
end
