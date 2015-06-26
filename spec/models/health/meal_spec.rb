require "rails_helper"

RSpec.describe Health::Meal, type: :model do
  it "has a valid factory" do
    expect(create(:health_meal)).to be_valid
  end
end
