class NotesEntry < ActiveRecord::Base
  table_name :notes_entries

  belongs_to :user
end

class AddUserToNotesEntries < ActiveRecord::Migration
  def up
    add_reference :notes_entries, :user, index: true, foreign_key: true
    NotesEntry.all.each do |entry|
      entry.user = User.first
      entry.save
    end
  end

  def down
    remove_reference :notes_entries, :user, index: true, foreign_key: true
  end
end
