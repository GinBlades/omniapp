class Health::WorkoutCategory < ActiveRecord::Base
  include Sluggable

  has_many :health_workouts, class_name: '::Health::Workout', foreign_key: 'health_workout_category_id'

  def to_s
    name
  end
end
