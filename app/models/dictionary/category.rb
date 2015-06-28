class Dictionary::Category < ActiveRecord::Base
  has_many :dictionary_entries, class_name: "::Dictionary::Entry"

  def to_s
    name
  end
end
