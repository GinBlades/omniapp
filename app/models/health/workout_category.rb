class Health::WorkoutCategory < ActiveRecord::Base
  has_many :health_workouts

  before_save :make_slug

  def make_slug
    self.slug = name.parameterize
  end
end
