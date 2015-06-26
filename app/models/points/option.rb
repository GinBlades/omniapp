class Points::Option < ActiveRecord::Base
  belongs_to :points_goal, class_name: "::Points::Goal"
  has_many :points_activities, dependent: :destroy,
    class_name: "::Points::Activity", foreign_key: "points_option_id"

  after_save :update_goal
  after_destroy :update_goal

  validates :points_goal_id, :points, :description, presence: true
  validates :description, length: { maximum: 100 }

  def to_s
    "#{points_goal.target}: #{description}"
  end

  protected

  def update_goal
    points_goal.update_current_points
  end
end
