class Dictionary::Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :source, class_name: "::Dictionary::Language"
  belongs_to :target, class_name: "::Dictionary::Language"
  belongs_to :dictionary_category, class_name: "::Dictionary::Category"

  after_save :update_counters
  after_destroy :update_counters

  scope :for_language, -> (language) { where("source_id = :language OR target_id = :language", language: language.id) }

  protected

    def update_counters
      source.entry_counter = source.dictionary_entries.count
      target.entry_counter = target.dictionary_entries.count
      dictionary_category.entry_counter = dictionary_category.dictionary_entries.count

      source.save
      target.save
      dictionary_category.save
    end
end
