class Notes::Entry < ActiveRecord::Base
  belongs_to :notes_category, class_name: '::Notes::Category'

  def to_s
    name
  end
end
