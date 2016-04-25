class Art::Detail < ActiveRecord::Base
  has_many :art_detailings, class_name: "::Art::Detailing"
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :random, -> { order("RANDOM()").first }
end
