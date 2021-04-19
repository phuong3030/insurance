FactoryBot.define do
  factory :property do
    sequence(:name) { |n| "name#{n.to_s}" }
    value { rand(0.0...100.0) }

    trait :with_contract do
      after(:build) do |property|
        property.contract = build(:contract)
      end
    end
  end
end
