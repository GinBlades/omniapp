class Art::Concept < ActiveRecord::Base
  belongs_to :art_subcategory, class_name: "::Art::Subcategory"
  belongs_to :art_mood, class_name: "::Art::Mood"
  belongs_to :art_genre, class_name: "::Art::Genre"
  has_many :art_detailings, as: :detailable, class_name: "::Art::Detailing", dependent: :destroy
  has_many :art_details, through: :art_detailings
  has_many :art_revisions, class_name: "::Art::Revision", foreign_key: :art_concept_id, dependent: :destroy

  after_create :assign_details

  delegate :art_category, to: :art_subcategory

  def unused_details
    art_subcategory.art_details - art_details
  end

  def assign_details
    art_subcategory.art_details.order("RANDOM()").limit(3).each do |detail|
      art_details << detail
    end
  end
end
