require 'rails_helper'

RSpec.describe Notes::Category, type: :model do
  it 'has a valid factory' do
    expect(create(:notes_category)).to be_valid
  end
end
