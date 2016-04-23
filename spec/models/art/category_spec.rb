require 'rails_helper'

RSpec.describe Art::Category, type: :model do
  it 'has a valid factory' do
    expect(create(:art_category)).to be_valid
  end
end
