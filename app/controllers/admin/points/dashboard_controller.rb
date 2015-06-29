class Admin::Points::DashboardController < AdminController
  def index
    @points_goals = ::Points::Goal.where(user: current_user)
    @points_daily_tasks = ::Points::DailyTask.where(user: current_user).order(entry_date: :desc).limit(10)
    @points_activities = ::Points::Activity.joins(points_option: { points_goal: :user })
      .where("users.id = ?", current_user.id).order(entry_date: :desc).limit(10)
  end
end
