require "rails_helper"

RSpec.describe Budget::Entry, type: :model do
  it "has a valid factory" do
    expect(create(:budget_entry)).to be_valid
  end
end
