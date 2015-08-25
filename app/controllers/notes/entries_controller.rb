class Notes::EntriesController < ApplicationController
  def index
    @q = ::Notes::Entry.ransack(params[:q])
    @notes_entries = @q.result(distinct: true).includes(:notes_category)
  end

  def show
    @notes_entry = ::Notes::Entry.find(params[:id])
  end
end
