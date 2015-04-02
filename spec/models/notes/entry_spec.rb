require 'rails_helper'

RSpec.describe Notes::Entry, type: :model do
  it 'has a valid factory' do
    expect(create(:notes_entry)).to be_valid
  end
end
