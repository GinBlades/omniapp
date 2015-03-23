require 'rails_helper'

RSpec.describe Health::Rating, type: :model do
  it 'has a valid factory' do
    expect(create(:health_rating)).to be_valid
  end
end
