require 'rails_helper'

RSpec.describe Health::Category, type: :model do
  it 'has a valid factory' do
    expect(create(:health_category)).to be_valid
  end
end
