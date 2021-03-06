class Blog::Comment < ActiveRecord::Base
  belongs_to :blog_post, class_name: "::Blog::Post"

  before_create do
    self.approved = true
  end

  validates :blog_post_id, :email, :body, presence: true

  scope :approved, -> { where(approved: true) }
end
