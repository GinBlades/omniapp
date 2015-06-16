require 'rails_helper'

RSpec.describe Points::DailyTask, type: :model do
  it 'has a valid factory' do
    expect(create(:points_daily_task)).to be_valid
  end
end
