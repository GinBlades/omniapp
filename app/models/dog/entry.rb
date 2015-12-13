class Dog::Entry < ActiveRecord::Base
  default_scope { order(entry_date: :desc) }
  def self.birthday
    Date.new(2015, 9, 12)
  end
end
