class Art::Revision < ActiveRecord::Base
  belongs_to :art_concept, class_name: "::Art::Concept"
end
