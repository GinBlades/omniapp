require "rails_helper"

RSpec.describe Dictionary::Entry, type: :model do
  it "has a valid factory" do
    expect(create(:dictionary_entry)).to be_valid
  end
end
