require "rails_helper"

RSpec.describe Health::Entry, type: :model do
  it "has a valid factory" do
    expect(create(:health_entry)).to be_valid
  end
end
