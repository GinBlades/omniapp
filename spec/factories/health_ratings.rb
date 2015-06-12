FactoryGirl.define do
  factory :health_rating, class: 'Health::Rating' do
    health_category nil
    health_entry nil
  end
end
