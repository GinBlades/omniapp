class Admin::Notes::DashboardController < AdminController
  def index
    @categories = ::Notes::Category.all
    @recent_entries = ::Notes::Entry.includes(:notes_category).order(updated_at: :desc).limit(10)
  end
end
