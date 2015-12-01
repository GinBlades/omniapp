class Dog::Entry < ActiveRecord::Base
  def self.birthday
    Date.new(2015, 9, 12)
  end
end
