class Notes::Entry < ActiveRecord::Base
  include Sluggable
  belongs_to :notes_category, class_name: "::Notes::Category"
  belongs_to :notes_sequence, class_name: "::Notes::Sequence"
  belongs_to :user

  validates :user_id, :name, :body, presence: :true

  def to_s
    name
  end
end
