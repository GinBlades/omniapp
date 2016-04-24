class Art::Subcategory < ActiveRecord::Base
  belongs_to :art_category, class_name: "::Art::Category"
  has_many :art_detailings, as: :detailable, class_name: "::Art::Detailing"
  has_many :art_details, through: :art_detailings
  has_many :art_concepts, class_name: "::Art::Concept", foreign_key: :art_subcategory_id
  scope :random, -> { order("RANDOM()").first }
end
