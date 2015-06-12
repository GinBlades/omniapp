class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :health_entries, class_name: '::Health::Entry'
  has_many :health_meals, class_name: '::Health::Meal'
  has_many :health_workouts, class_name: '::Health::Workout'
  has_many :budget_entries, class_name: '::Budget::Entry'

  def budget_entries_for_month(date)
    month_start = date.beginning_of_month
    month_end = date.end_of_month
    budget_entries.where('entry_date < ?', month_end).where('entry_date > ?', month_start)
  end

  def full_name
    [first_name, last_name].select(&:present?).join(' ')
  end

  def to_s
    full_name || email
  end
end
