class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :health_entries, class_name: '::Health::Entry'
  has_many :health_meals, class_name: '::Health::Meal'
  has_many :health_workouts, class_name: '::Health::Workout'

  def full_name
    [first_name,last_name].select(&:present?).join(' ')
  end

  def to_s
    full_name || email
  end

end
