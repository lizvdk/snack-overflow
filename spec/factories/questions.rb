FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "#{n} MyString" }
    sequence(:description) { |n| "#{n} MyText" }
    user
    category
  end
end
