require 'rails_helper'

RSpec.describe Art::Subcategory, type: :model do
  it 'has a valid factory' do
    expect(create(:art_subcategory)).to be_valid
  end
end
