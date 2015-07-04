FactoryGirl.define do
  factory :dictionary_entry, class: "Dictionary::Entry" do
    source nil
    target nil
    category nil
    definition "MyString"
    examples "MyString"
  end
end
