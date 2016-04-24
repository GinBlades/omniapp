class Art::Genre < ActiveRecord::Base
  has_many :art_concepts, class_name: "::Art::Concept", foreign_key: :art_genre_id
  scope :random, -> { order("RANDOM()").first }
end
