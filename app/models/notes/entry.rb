class Notes::Entry < ActiveRecord::Base
  belongs_to :notes_category, class_name: '::Notes::Category'
end
