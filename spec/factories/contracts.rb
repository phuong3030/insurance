FactoryBot.define do
  factory :contract do
    billing_cycle { 12 }
    user { build(:user) }
    properties { FactoryBot.build_list(:property, 5) }
  end
end
