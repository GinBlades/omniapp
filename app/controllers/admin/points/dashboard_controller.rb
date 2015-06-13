module Points
  class DashboardController < ::AdminController
    def index
      @points_goals = Goal.find_by(user: current_user)
      @points_activities = Activity.all
    end
  end
end
