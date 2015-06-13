require 'rails_helper'

RSpec.describe Points::Activity, type: :model do
  it 'has a valid factory' do
    expect(create(:points_activity)).to be_valid
  end
end
