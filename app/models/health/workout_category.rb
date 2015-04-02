class Health::WorkoutCategory < ActiveRecord::Base
  include Sluggable
  has_many :health_workouts, class_name: '::Health::Workout'

  def to_s
    name
  end
end
