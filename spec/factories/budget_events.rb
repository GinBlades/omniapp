FactoryGirl.define do
  factory :budget_event, class: 'Budget::Event' do
    payee nil
    event_date "2015-03-30"
    price "9.99"
    recurring false
    event_action "MyString"
    url "MyString"
    alert_date "2015-03-30"
  end
end
