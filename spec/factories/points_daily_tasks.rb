FactoryGirl.define do
  factory :points_daily_task, class: 'Points::DailyTask' do
    entry_date "2015-06-16"
    tasks "MyString"
    success 1
    points_option nil
  end
end
