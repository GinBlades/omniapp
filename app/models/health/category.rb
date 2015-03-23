class Health::Category < ActiveRecord::Base
  has_many :health_ratings

  before_save :make_slug

  def make_slug
    self.slug = name.parameterize
  end
end
