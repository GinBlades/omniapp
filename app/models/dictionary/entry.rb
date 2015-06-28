class Dictionary::Entry < ActiveRecord::Base
  belongs_to :source, class_name: "::Dictionary::Language"
  belongs_to :target, class_name: "::Dictionary::Language"
  belongs_to :dictionary_category, class_name: "::Dictionary::Category"
end
