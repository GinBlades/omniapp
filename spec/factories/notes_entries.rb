FactoryGirl.define do
  factory :notes_entry, class: 'Notes::Entry' do
    name "MyString"
    slug "MyString"
    body "MyString"
    notes_category nil
  end
end
