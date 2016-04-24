FactoryGirl.define do
  factory :art_concept, class: 'Art::Concept' do
    art_subcategory nil
    art_mood nil
    art_genre nil
    name "MyString"
    sources "MyString"
  end
end
