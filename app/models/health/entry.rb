class Health::Entry < ActiveRecord::Base
  belongs_to :user
  has_many :health_ratings, class_name: '::Health::Rating', foreign_key: 'health_entry_id'
  accepts_nested_attributes_for :health_ratings, reject_if: :all_blank, allow_destroy: true

  def name
    "Entry #{id}"
  end
end
