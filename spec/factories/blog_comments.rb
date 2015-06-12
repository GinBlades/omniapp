FactoryGirl.define do
  factory :blog_comment, class: 'Blog::Comment' do
    name "MyString"
    email "MyString"
    body "MyString"
    approved false
    post nil
  end
end
