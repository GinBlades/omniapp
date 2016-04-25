class Art::Revision < ActiveRecord::Base
  belongs_to :art_concept, class_name: "::Art::Concept"

  validates :image, presence: true
  mount_uploader :image, ::ImageUploader

  scope :most_recent, -> { order(version: :desc).first }
end
