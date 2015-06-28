require 'rails_helper'

RSpec.describe Dictionary::Category, type: :model do
  it 'has a valid factory' do
    expect(create(:dictionary_category)).to be_valid
  end
end
