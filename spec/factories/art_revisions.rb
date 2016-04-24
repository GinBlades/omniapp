FactoryGirl.define do
  factory :art_revision, class: 'Art::Revision' do
    art_concept nil
    version 1.5
    image "MyString"
  end
end
