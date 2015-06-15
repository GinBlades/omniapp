$connection_params = {
  adapter: 'postgresql',
  database: 'points_temp'
}
class OldActivity < ActiveRecord::Base
  establish_connection($connection_params)
  self.table_name = :points_activities
  belongs_to :option, class_name: 'OldOption', foreign_key: 'points_option_id'
end
class OldGoal < ActiveRecord::Base
  establish_connection($connection_params)
  self.table_name = :points_goals
  has_many :options, class_name: 'OldOption', foreign_key: 'points_goal_id'
  belongs_to :user, class_name: 'OldUser', foreign_key: 'user_id'
end
class OldUser < ActiveRecord::Base
  establish_connection($connection_params)
  self.table_name = :users
  has_many :goals, class_name: 'OldGoal', foreign_key: 'user_id'
end
class OldOption < ActiveRecord::Base
  establish_connection($connection_params)
  self.table_name = :points_options
  belongs_to :goal, class_name: 'OldGoal', foreign_key: 'points_goal_id'
  has_many :activities, class_name: 'OldActivity', foreign_key: 'points_option_id'
end
class ImportOldPoints < ActiveRecord::Migration
  def up
    begin
      OldGoal.all.each do |goal|
        Points::Goal.create(
          user_id: User.find_by(email: goal.user.email).id,
          target: goal.target,
          expiration: goal.expiration,
          completed: goal.completed,
          current_points: goal.current_points,
          points_to_complete: goal.points_to_complete,
          reward: goal.reward
        )
      end

      OldOption.all.each do |option|
        Points::Option.create(
          points_goal_id: Points::Goal.find_by(target: option.goal.target).id,
          description: option.description,
          points: option.points
        )
      end

      OldActivity.all.each do |activity|
        Points::Activity.create(
          points_option_id: Points::Option.find_by(description: activity.option.description).id,
          entry_date: activity.entry_date,
          note: activity.note
        )
      end
    rescue ActiveRecord::NoDatabaseError => e
      Rails.logger.info e.message
    end
  end

  def down
    # Points::Goal.destroy_all
  end
end
