class Admin::Points::DashboardController < AdminController
  def index
    @points_goals = ::Points::Goal.where(user: current_user)
    @points_activities = ::Points::Activity.order(entry_date: :desc).limit(10)
  end
end
