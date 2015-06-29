class Admin::Dictionary::DashboardController < ApplicationController
  def index
    @entries = current_user.dictionary_entries.includes(:source, :target).order(created_at: :desc).limit(10)
    @languages = ::Dictionary::Language.where.not(entry_counter: 0).order(name: :asc)
    @categories = ::Dictionary::Category.where.not(entry_counter: 0).order(name: :asc)
  end
end
