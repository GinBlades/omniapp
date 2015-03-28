class Health::Entry < ActiveRecord::Base
  belongs_to :user
  has_many :health_ratings, class_name: '::Health::Rating', foreign_key: 'health_entry_id'
  accepts_nested_attributes_for :health_ratings, reject_if: :all_blank, allow_destroy: true

  def day_length
    entry_date.beginning_of_day..entry_date.end_of_day
  end

  def meals
    user.health_meals.where(time: day_length)
  end
  
  def workouts
    user.health_workouts.where(start: day_length)
  end

  def name
    "Entry #{id}"
  end
end
