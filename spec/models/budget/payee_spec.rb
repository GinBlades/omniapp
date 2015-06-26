require "rails_helper"

RSpec.describe Budget::Payee, type: :model do
  it "has a valid factory" do
    expect(create(:budget_payee)).to be_valid
  end
end
