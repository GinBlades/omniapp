class Allowance::Entry < ActiveRecord::Base
  belongs_to :user

  class << self
    def balance(entries)
      -(entries.map(&:price).inject(:+))
    end

    def merge(field, from, to)
      where(field => from).update_all(field => to)
    end
  end
end
