require "rails_helper"

RSpec.describe Allowance::Entry, type: :model do
  it "has a valid factory" do
    expect(create(:allowance_entry)).to be_valid
  end
end
