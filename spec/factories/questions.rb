FactoryGirl.define do
  factory :question do
    title "MyString"
    description "MyText"
    user
  end
end
