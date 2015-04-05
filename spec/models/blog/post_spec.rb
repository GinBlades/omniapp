require 'rails_helper'

RSpec.describe Blog::Post, type: :model do
  it 'has a valid factory' do
    expect(create(:blog_post)).to be_valid
  end
end
