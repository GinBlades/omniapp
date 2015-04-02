class Notes::Category < ActiveRecord::Base
  include Sluggable
  has_many :notes_entries, class_name: '::Notes::Entry', foreign_key: 'notes_category_id'

  def to_s
    name
  end
end
