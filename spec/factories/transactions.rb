# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    user_id 1
    name "MyString"
    amount 1
    kind "MyString"
  end
end
