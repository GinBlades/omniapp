class Art::Concept < ActiveRecord::Base
  belongs_to :art_subcategory, class_name: "::Art::Subcategory"
  belongs_to :art_mood, class_name: "::Art::Mood"
  belongs_to :art_genre, class_name: "::Art::Genre"
  has_many :art_detailings, as: :detailable, class_name: "::Art::Detailing"
  has_many :art_details, through: :art_detailings
  has_many :art_revisions, class_name: "::Art::Revision", foreign_key: :art_concept_id

  delegate :art_category, to: :art_subcategory
end
