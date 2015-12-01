class Allowance::Entry < ActiveRecord::Base
  belongs_to :user

  def self.balance(entries)
    -(entries.map(&:price).inject(:+))
  end
end
