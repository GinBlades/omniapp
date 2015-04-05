class Blog::Post < ActiveRecord::Base
  include Sluggable
  belongs_to :user
  has_many :blog_comments, class_name: '::Blog::Comment', foreign_key: 'blog_post_id', dependent: :destroy
  alias_attribute :name, :title
  acts_as_taggable

  validates :title, :body, :published_at, presence: true

  def to_s
    title
  end
end
