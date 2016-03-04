FactoryGirl.define do
  factory :allowance_task, class: 'Allowance::Task' do
    goal "MyString"
    reward "MyString"
    days 1
    complete false
  end
end
