FactoryBot.define do
  factory :contract do
    billing_cycle { 12 }
    user { build(:user) }
    theft_coverage { 100.0 }
    deductible { -10.0 }
  end
end
