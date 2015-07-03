class Admin::Health::DashboardController < AdminController
  def index
    @health_entries = ::Health::Entry.order(entry_date: :desc)
    @health_meals = ::Health::Meal.order(time: :desc)
    @health_workouts = ::Health::Workout.order(start: :desc)
  end
end
