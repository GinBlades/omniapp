require 'rails_helper'

RSpec.describe Points::Option, type: :model do
  it 'has a valid factory' do
    expect(create(:points_option)).to be_valid
  end
end
