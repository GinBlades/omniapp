class Health::Workout < ActiveRecord::Base
  belongs_to :health_workout_category, class_name: '::Health::WorkoutCategory'
  belongs_to :user

  delegate :name, to: :health_workout_category

  validates :health_workout_category_id, :start, :duration, :rating, presence: true

  def to_s
    "#{start.try(:strftime, "%Y/%m/%d")}-#{name}"
  end
end
