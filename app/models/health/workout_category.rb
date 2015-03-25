class Health::WorkoutCategory < ActiveRecord::Base
  has_many :health_workouts, class_name: '::Health::Workout'

  before_save :make_slug

  def make_slug
    self.slug = name.parameterize
  end

  def to_s
    name
  end
end
