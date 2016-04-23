require 'rails_helper'

RSpec.describe Art::Detail, type: :model do
  it 'has a valid factory' do
    expect(create(:art_detail)).to be_valid
  end
end
