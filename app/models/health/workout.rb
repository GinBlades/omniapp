class Health::Workout < ActiveRecord::Base
  belongs_to :health_workout_category, class_name: '::Health::WorkoutCategory'
  belongs_to :user
end
