class Budget::Category < ActiveRecord::Base
  include Sluggable
  has_many :budget_subcategories, class_name: "::Budget::Subcategory", foreign_key: "budget_category_id", dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    name
  end
end
