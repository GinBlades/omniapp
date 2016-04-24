class Art::Detailing < ActiveRecord::Base
  belongs_to :detailable, polymorphic: true
  belongs_to :art_detail, class_name: "::Art::Detail"
end
