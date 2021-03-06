class Art::Mood < ActiveRecord::Base
  has_many :art_concepts, class_name: "::Art::Concept", foreign_key: :art_mood_id
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :random, -> { order("RANDOM()").first }
end
