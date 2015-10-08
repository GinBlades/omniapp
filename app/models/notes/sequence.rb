class Notes::Sequence < ActiveRecord::Base
  belongs_to :notes_category, class_name: "::Notes::Category"
  has_many :notes_entries, class_name: "::Notes::Entry", foreign_key: "notes_sequence_id"

  validates :name, :notes_category_id, presence: true

  def to_s
    name
  end
end