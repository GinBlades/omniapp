FactoryGirl.define do
  factory :allowance_entry, :class => 'Allowance::Entry' do
    user nil
entry_date "2015-12-12"
price "9.99"
payee "MyString"
category "MyString"
notes "MyString"
  end

end
