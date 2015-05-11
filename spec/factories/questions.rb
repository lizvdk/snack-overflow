FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "#{n} MyString" }
    sequence(:description) { |n| "#{n} MyText" }
    user
  end
end
