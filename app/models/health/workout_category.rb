class Health::WorkoutCategory < ActiveRecord::Base
  include Sluggable
  has_many :health_workouts, class_name: '::Health::Workout'

  default_scope { order(:name) }

  def to_s
    name
  end
end
