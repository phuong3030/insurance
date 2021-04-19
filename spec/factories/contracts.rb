FactoryBot.define do
  factory :contract do
    billing_cycle { 12 }
    user { build(:user) }

    trait :with_properties do
      after(:build) do |contract|
        contract.properties = FactoryBot.build_list(:property, 5)
      end
    end
  end
end
