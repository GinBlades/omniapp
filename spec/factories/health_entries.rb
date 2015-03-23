FactoryGirl.define do
  factory :health_entry, :class => 'Health::Entry' do
    user nil
entry_date "2015-03-22"
notes "MyString"
  end

end
