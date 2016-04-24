require 'rails_helper'

RSpec.describe Art::Concept, type: :model do
  it 'has a valid factory' do
    expect(create(:art_concept)).to be_valid
  end
end
