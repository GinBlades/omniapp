class Admin::Health::DashboardController < AdminController
  def index
    @health_entries = ::Health::Entry.order(entry_date: :desc).limit(5)
    @health_meals = ::Health::Meal.order(time: :desc).limit(5)
    @health_workouts = ::Health::Workout.order(start: :desc).includes(:user, :health_workout_category).limit(5)
  end
end
