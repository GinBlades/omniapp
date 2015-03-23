class Health::Meal < ActiveRecord::Base
  belongs_to :user

  enum meal_category: [:snack, :breakfast, :lunch, :dinner]
end
