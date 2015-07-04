require "rails_helper"

RSpec.describe Dictionary::Language, type: :model do
  it "has a valid factory" do
    expect(create(:dictionary_language)).to be_valid
  end
end
