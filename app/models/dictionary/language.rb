class Dictionary::Language < ActiveRecord::Base
  has_many :source_entries, class_name: "::Dictionary::Entry", foreign_key: "source_id", dependent: :destroy
  has_many :target_entries, class_name: "::Dictionary::Entry", foreign_key: "target_id", dependent: :destroy

  def dictionary_entries
    Dictionary::Entry.for_language(self)
  end

  def to_s
    name
  end
end
