FactoryBot.define do
  factory :contract do
    user { build(:user) }
  end
end
