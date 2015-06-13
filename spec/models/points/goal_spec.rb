require 'rails_helper'

RSpec.describe Points::Goal, type: :model do
  it 'has a valid factory' do
    expect(create(:points_goal)).to be_valid
  end
end
