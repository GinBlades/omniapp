class Notes::DashboardController < ApplicationController
  def index
    @q = ::Notes::Entry.ransack(params[:q])
    if current_user
      @categories = ::Notes::Entry.joins(:notes_category).select("notes_categories.id, notes_categories.name, count(*) AS note_count").where(user: current_user).group('notes_categories.name, notes_categories.id')
      @sequences = ::Notes::Entry.joins(:notes_sequence).select("notes_sequences.id, notes_sequences.name, count(*) AS note_count").where(user: current_user).group('notes_sequences.name, notes_sequences.id')
      @recent_entries = current_user.notes_entries.includes(:notes_category).order(updated_at: :desc).limit(10)
    else
      @categories = ::Notes::Entry.joins(:notes_category).select("notes_categories.id, notes_categories.name, count(*) AS note_count").group('notes_categories.name, notes_categories.id')
      @sequences = ::Notes::Entry.joins(:notes_sequence).select("notes_sequences.id, notes_sequences.name, count(*) AS note_count").group('notes_sequences.name, notes_sequences.id')
      @recent_entries = ::Notes::Entry.includes(:notes_category).order(updated_at: :desc).limit(10)
    end
  end
end
