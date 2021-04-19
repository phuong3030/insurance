FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "a#{n}@email.com" }
    password { "123123123" }
  end
end
