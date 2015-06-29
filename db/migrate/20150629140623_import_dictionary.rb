class BaseConnection
  def self.connection_params
    {
      adapter: "postgresql",
      database: "dictionary_temp"
    }
  end
end
class OldCategory < ActiveRecord::Base
  establish_connection(BaseConnection.connection_params)
  self.table_name = :categories
  has_many :entries, class_name: "OldEntry", foreign_key: "category_id"
end

class OldEntry < ActiveRecord::Base
  establish_connection(BaseConnection.connection_params)
  self.table_name = :entries
  belongs_to :category, class_name: "OldCategory", foreign_key: "category_id"
end

class ImportDictionary < ActiveRecord::Migration
  def up
    # jihye = User.find_by(first_name: "Jihye")
    # korean = Dictionary::Language.find_or_create_by(name: "Korean")
    # english = Dictionary::Language.find_or_create_by(name: "English")
    # uncategorized = Dictionary::Category.find_or_create_by(name: "Uncategorized") 
    # OldCategory.all.each do |category|
    #   puts "Creating category..."
    #   Dictionary::Category.create(name: category.name)
    # end

    # OldEntry.all.each do |entry|
    #   category = if entry.category
    #     Dictionary::Category.find_by(name: entry.category.name) 
    #   else
    #     uncategorized
    #   end
    #   Dictionary::Entry.create(
    #     user: jihye,
    #     source: english,
    #     word: entry.word,
    #     target: korean,
    #     definition: entry.definition,
    #     dictionary_category: category,
    #     examples: entry.examples,
    #     notes: entry.korean
    #   )
    # end
  end

  def down
    # do nothing
  end
end
