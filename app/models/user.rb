class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :health_entries, class_name: "::Health::Entry", dependent: :destroy
  has_many :health_meals, class_name: "::Health::Meal", dependent: :destroy
  has_many :health_workouts, class_name: "::Health::Workout", dependent: :destroy
  has_many :budget_entries, class_name: "::Budget::Entry", dependent: :destroy
  has_many :points_goals, class_name: "::Points::Goal", dependent: :destroy
  has_many :points_daily_tasks, class_name: "::Points::DailyTask", dependent: :destroy
  has_many :dictionary_entries, class_name: "::Dictionary::Entry", dependent: :destroy
  has_many :blog_posts, class_name: "::Blog::Post", dependent: :destroy
  has_many :notes_entries, class_name: "::Notes::Entry", dependent: :destroy
  has_many :allowance_entries, class_name: "::Allowance::Entry", dependent: :destroy
  has_many :allowance_tasks, class_name: "::Allowance::Task", dependent: :destroy

  def budget_entries_for_month(date)
    month_start = date.beginning_of_month
    month_end = date.end_of_month
    budget_entries.where("entry_date < ?", month_end).where("entry_date > ?", month_start).where(allowance: true)
  end

  def allowance_entries_for_month(date)
    budget_entries_for_month(date).where(allowance: true)
  end

  def full_name
    [first_name, last_name].select(&:present?).join(" ")
  end

  def allowance_balance
    ::Allowance::Entry.balance(allowance_entries)
  end

  def to_s
    full_name || email
  end
end
