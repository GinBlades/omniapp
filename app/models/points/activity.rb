class Points::Activity < ActiveRecord::Base
  belongs_to :points_option, class_name: '::Points::Option'

  validates :points_option_id, :entry_date, presence: true
  validates :note, length: { maximum: 100 }

  delegate :description, :points, to: :points_option

  after_save :update_goal
  after_destroy :update_goal

  def direct_goal
    ::Points::Goal.joins(points_options: :points_activities).where('points_activities.id = ?', id).first
  end

  def direct_user
    User.joins(points_goals: { points_options: :points_activities }).where('points_activities.id = ?', id).first
  end

  protected

  def update_goal
    points_option.points_goal.update_current_points
  end
end
