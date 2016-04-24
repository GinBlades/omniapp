require 'rails_helper'

RSpec.describe Art::Revision, type: :model do
  it 'has a valid factory' do
    expect(create(:art_revision)).to be_valid
  end
end
