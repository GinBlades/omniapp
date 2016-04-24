class Art::Category < ActiveRecord::Base
  has_many :art_subcategories, class_name: "::Art::Subcategory", foreign_key: :art_category_id

  scope :random, -> { order("RANDOM()").first }
end
