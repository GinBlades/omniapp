require 'rails_helper'

RSpec.describe Notes::Sequence, type: :model do
  it 'has a valid factory' do
    expect(create(:notes_sequence)).to be_valid
  end
end
