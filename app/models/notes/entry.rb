class Notes::Entry < ActiveRecord::Base
  include Sluggable
  belongs_to :notes_category, class_name: '::Notes::Category'

  def to_s
    name
  end
end
