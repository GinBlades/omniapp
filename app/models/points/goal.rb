class Points::Goal < ActiveRecord::Base
  belongs_to :user
  has_many :points_options, dependent: :destroy,
    class_name: '::Points::Option', foreign_key: 'points_goal_id'
  has_many :points_activities, through: :points_options 

  validates :user_id, :target, :expiration, :points_to_complete, presence: true
  validates :target, :reward, length: { maximum: 300 }

  def progress_percent
    ((current_points / points_to_complete.to_f) * 100).to_i
  end
end
