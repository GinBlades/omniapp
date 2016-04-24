class Art::Category < ActiveRecord::Base
  has_many :art_subcategories, class_name: "::Art::Subcategory", foreign_key: :art_category_id
  has_many :art_concepts, through: :art_subcategories

  scope :random, -> { order("RANDOM()").first }
end
