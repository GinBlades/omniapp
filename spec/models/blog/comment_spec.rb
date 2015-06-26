require "rails_helper"

RSpec.describe Blog::Comment, type: :model do
  it "has a valid factory" do
    expect(create(:blog_comment)).to be_valid
  end
end
