require 'rails_helper'

RSpec.describe Budget::Category, type: :model do
  it 'has a valid factory' do
    expect(create(:budget_category)).to be_valid
  end
end
