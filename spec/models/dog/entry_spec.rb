require "rails_helper"

RSpec.describe Dog::Entry, type: :model do
  it "has a valid factory" do
    expect(create(:dog_entry)).to be_valid
  end
end
