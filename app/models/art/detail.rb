class Art::Detail < ActiveRecord::Base
  has_many :art_detailings, class_name: "::Art::Detailing"
  scope :random, -> { order("RANDOM()").first }
end
