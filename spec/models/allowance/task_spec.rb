require 'rails_helper'

RSpec.describe Allowance::Task, type: :model do
  it 'has a valid factory' do
    expect(create(:allowance_task)).to be_valid
  end
end
