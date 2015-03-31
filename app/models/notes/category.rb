class Notes::Category < ActiveRecord::Base
  has_many :notes_entries, class_name: '::Notes::Entry', foreign_key: 'notes_category_id'
end
