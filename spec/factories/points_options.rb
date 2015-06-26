FactoryGirl.define do
  factory :points_option, class: "Points::Option" do
    points_goal nil
    description "MyString"
    points 1
  end
end
