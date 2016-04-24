class Art::Subcategory < ActiveRecord::Base
  belongs_to :art_category, class_name: "::Art::Category"
  has_many :art_details, class_name: "::Art::Detail", foreign_key: :art_subcategory_id
  has_many :art_concepts, class_name: "::Art::Concept", foreign_key: :art_subcategory_id
  scope :random, -> { order("RANDOM()").first }
end
