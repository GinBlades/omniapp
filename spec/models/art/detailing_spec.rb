require 'rails_helper'

RSpec.describe Art::Detailing, type: :model do
  it 'has a valid factory' do
    expect(create(:art_detailing)).to be_valid
  end
end
