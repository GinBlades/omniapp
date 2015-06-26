FactoryGirl.define do
  factory :budget_subcategory, class: "Budget::Subcategory" do
    name "MyString"
    slug "MyString"
    budget_category nil
  end
end
