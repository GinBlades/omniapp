FactoryGirl.define do
  factory :points_goal, class: "Points::Goal" do
    user nil
    target "MyString"
    expiration "2015-06-12"
    completed false
    current_points 1
    points_to_complete 1
    reward "MyString"
  end
end
