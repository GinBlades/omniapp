require 'mongoid'

namespace :import do
  desc "Import notes from MongoDB"
  task notes: :environment do
    Mongoid::Config.load!("#{Rails.root}/lib/tasks/mongoid.yml", :production)

    class Entry
      include Mongoid::Document
      include Mongoid::Timestamps
      field :title
      field :body
      belongs_to :category
    end

    class Category
      include Mongoid::Document
      include Mongoid::Timestamps
      field :name
      field :slug
      has_many :entries
    end

    Category.all.each do |category|
      ::Notes::Category.create(
        name: category.name,
        slug: category.slug
      )
    end

    Entry.all.each do |entry|
      category = ::Notes::Category.find_by(slug: entry.category.slug)
      ::Notes::Entry.create(
        name: entry.title,
        slug: entry.title.parameterize,
        body: entry.body,
        notes_category: category
      )
    end
  end
end
