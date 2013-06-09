# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    user_id 1
    name "MyString"
    amount { rand(1..100_000) }
    kind { %i(income outcome).sample }
  end
end
