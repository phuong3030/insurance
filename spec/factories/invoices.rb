FactoryBot.define do
  factory :invoice do
    contract { build(:contract) }
  end
end
