FactoryGirl.define do
  factory :budget_entry, class: "Budget::Entry" do
    budget_payee nil
    budget_subcategory nil
    price "9.99"
    note "MyString"
    entry_date "2015-03-30"
  end
end
