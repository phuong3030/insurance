FactoryBot.define do
  factory :contract do
    billing_cycle { 12 }
    user { build(:user) }
  end
end
