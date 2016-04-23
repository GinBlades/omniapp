class Art::Subcategory < ActiveRecord::Base
  belongs_to :art_category, class_name: "::Art::Category"
  has_many :art_details, class_name: "::Art::Detail", foreign_key: :art_subcategory_id
end
