# This will guess the User class
FactoryGirl.define do
  factory :link do
    sequence(:long_url) { |n| "http://www.google#{n}.com" }
  end
end
