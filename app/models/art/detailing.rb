class Art::Detailing < ActiveRecord::Base
  belongs_to :detailable, polymorphic: true
  belongs_to :art_detail, class_name: "::Art::Detail"

  validates :art_detail_id, :detailable_id, :detailable_type, presence: true
end
