require 'rails_helper'

RSpec.describe Art::Genre, type: :model do
  it 'has a valid factory' do
    expect(create(:art_genre)).to be_valid
  end
end
