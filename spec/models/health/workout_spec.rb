require "rails_helper"

RSpec.describe Health::Workout, type: :model do
  it "has a valid factory" do
    expect(create(:health_workout)).to be_valid
  end
end
