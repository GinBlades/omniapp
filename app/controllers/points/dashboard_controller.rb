module Points
  class DashboardController < ApplicationController
    def index
      @points_goals = Goal.all
      @points_activities = Activity.all
    end
  end
end
