class Art::Detail < ActiveRecord::Base
  belongs_to :art_subcategory, class_name: "::Art::Subcategory"
  scope :random, -> { order("RANDOM()").first }
end
