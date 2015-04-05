FactoryGirl.define do
  factory :blog_post, :class => 'Blog::Post' do
    user nil
title "MyString"
slug "MyString"
excerpt "MyString"
body "MyString"
published_at "2015-04-05 08:46:16"
  end

end
