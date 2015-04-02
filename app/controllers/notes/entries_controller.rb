class Notes::EntriesController < ApplicationController
  def index
    @notes_entries = ::Notes::Entry.all
  end

  def show
    @notes_entry = ::Notes::Entry.find(params[:id])
  end
end
