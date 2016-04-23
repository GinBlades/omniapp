require 'rails_helper'

RSpec.describe Art::Mood, type: :model do
  it 'has a valid factory' do
    expect(create(:art_mood)).to be_valid
  end
end
