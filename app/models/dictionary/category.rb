class Dictionary::Category < ActiveRecord::Base
  has_many :dictionary_entries, class_name: "::Dictionary::Entry", foreign_key: "dictionary_category_id", dependent: :destroy

  def to_s
    name
  end
end
