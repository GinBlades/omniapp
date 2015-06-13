class Points::Option < ActiveRecord::Base
  belongs_to :points_goal, class_name: '::Points::Goal'
  has_many :points_activities, dependent: :destroy,
    class_name: '::Points::Activity', foreign_key: 'points_option_id'

  validates :points_goal_id, :points, :description, presence: true
  validates :description, length: { maximum: 100 }

  def to_s
    description
  end
end
