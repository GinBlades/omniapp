require 'rails_helper'

RSpec.describe Budget::Event, type: :model do
  it 'has a valid factory' do
    expect(create(:budget_event)).to be_valid
  end
end
