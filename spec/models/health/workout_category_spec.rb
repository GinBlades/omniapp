require 'rails_helper'

RSpec.describe Health::WorkoutCategory, type: :model do
  it 'has a valid factory' do
    expect(create(:health_workout_category)).to be_valid
  end
end
