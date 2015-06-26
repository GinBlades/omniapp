require "rails_helper"

RSpec.describe Budget::Subcategory, type: :model do
  it "has a valid factory" do
    expect(create(:budget_subcategory)).to be_valid
  end
end
